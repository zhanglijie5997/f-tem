import 'package:art_app/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

extension ScrollControllerExt on ScrollController {
  /// 滚动到底部
  Future scrollToBottom() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(180.microseconds, () async {
        while (position.pixels != position.maxScrollExtent) {
          jumpTo(position.maxScrollExtent);
          await SchedulerBinding.instance.endOfFrame;
        }
      });
    });
  }

  /// 滚动到底部
  Future animatedScrollToBottom([bool? isScrollToBottom]) async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (isScrollToBottom ?? true) {
         if (position.maxScrollExtent - position.pixels > 500) {
          jumpTo(position.pixels - 500);
          await SchedulerBinding.instance.endOfFrame;
        }
        if (position.pixels != position.maxScrollExtent && (isScrollToBottom ?? true)) {
          animateTo(position.maxScrollExtent,
              duration: 300.milliseconds, curve: Curves.linear);
          await SchedulerBinding.instance.endOfFrame;
        }
      }
    });
  }

  /// 滚动到顶部
  Future scrollToTop() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      while (position.pixels != position.minScrollExtent) {
        jumpTo(position.minScrollExtent);
        await SchedulerBinding.instance.endOfFrame;
      }
    });
  }
}

class CustomChatListViewController<E> {
  /// 添加数据 insert(0,T) 或 insertAll(0,<T>[])
  /// UI上index:length-1 -> 0
  final List<E> _topList = <E>[];

  /// 添加数据 add(T) 或 addAll(<T>[])
  /// UI上index:0->length-1
  final List<E> _bottomList = <E>[];

  Function(int?, dynamic)? fn;

  List<E> get topList => _topList;

  List<E> get bottomList => _bottomList;

  List<E> get list => _topList + _bottomList;

  int get length => list.length;

  CustomChatListViewController(List<E> list) {
    _bottomList.addAll(list);
  }

  void changeStatus(E msg) {}

  void insertToTop(E data) {
    _topList.insert(0, data);
  }

  void addListener(Function(int?, dynamic)? v) {
    fn = v;
  }

  void removeListener() {
    fn = null;
  }

  void insertAllToTop(Iterable<E> iterable) {
    _topList.insertAll(0, iterable);
  }

  Function()? addInsertOrAddListenerCallback;

  void addInsertOrAddListener(Function() fn) {
    addInsertOrAddListenerCallback = fn;
  }

  void insertToBottom(E data) {
    // data as Message;
    // fn?.call(null, null);
    _bottomList.add(data);
    addInsertOrAddListenerCallback?.call();
  }

  void insertAllToBottom(Iterable<E> iterable) {
    _bottomList.addAll(iterable);
  }

  /// [position] 使用 [CustomChatListViewItemBuilder]的position
  E elementAt(int position) => list.elementAt(position);

  /// [position] 使用 [CustomChatListViewItemBuilder]的position
  E removeAt(int position) {
    fn?.call(position, null);
    return list.removeAt(position);
  }

  bool remove(Object? value) {
    return list.remove(value);
  }

  bool removeAll() {
    list.removeRange(0, list.length);
    _topList.clear();
    _bottomList.clear();
    return true;
  }

  /// max = pageNo * pageSize
  bool bottomHasMore({required int max}) => _bottomList.length < max;

  /// max = pageNo * pageSize
  bool topHasMore({required int max}) => _topList.length < max;
}

/// [index] 在上下列表实际的index
/// [position] 真个界面上的position
/// [data] 数据
typedef CustomChatListViewItemBuilder<T> = Widget Function(
  BuildContext context,
  int index,
  int position,
  T data,
);

class CustomChatListView extends StatefulWidget {
  const CustomChatListView(
      {Key? key,
      required this.itemBuilder,
      required this.controller,
      // this.topList = const [],
      // this.bottomList = const [],
      this.scrollController,
      this.onScrollToTopLoad,
      this.onScrollToBottomLoad,
      this.enabledBottomLoad = false,
      this.enabledTopLoad = false,
      this.indicatorColor,
      required this.isScroll})
      : super(key: key);

  final bool isScroll;

  /// index: topList/bottomList的下标
  /// position: 整个列表的下标
  final CustomChatListViewItemBuilder itemBuilder;

  /// 添加数据 insert(0,T) 或 insertAll(0,<T>[])
  /// UI上index:length-1 -> 0
  // final List<T> topList;

  /// 添加数据 add(T) 或 addAll(<T>[])
  /// UI上index:0->length-1
  // final List<T> bottomList;

  final CustomChatListViewController controller;

  ///
  final ScrollController? scrollController;

  /// 滚动到顶部加载，返回ture：还存在未加载完的数据。false：已经没有更多的数据了
  final Future<bool> Function()? onScrollToTopLoad;

  /// 滚动到底部加载，返回ture：还存在未加载完的数据。false：已经没有更多的数据了
  final Future<bool> Function()? onScrollToBottomLoad;

  /// 启用顶部加载
  final bool enabledTopLoad;

  /// 启动底部加载
  final bool enabledBottomLoad;

  final Color? indicatorColor;

  @override
  State<CustomChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<CustomChatListView>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final Key centerKey = const ValueKey('second-sliver-list');

  var _bottomHasMore = true;

  var _topHasMore = true;

  var _isScollToBottom = true;

  addInsertOrAddListener() {
    setState(() {
      if (mounted) {
        widget.scrollController?.animatedScrollToBottom(_isScollToBottom);
      }
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    widget.scrollController?.addListener(() {
      
      if (widget.enabledBottomLoad && _isBottom && _bottomHasMore) {
        _onScrollToBottomLoadMore();
      } else if (widget.enabledTopLoad && _isTop && _topHasMore) {
        _onScrollToTopLoadMore();
      }
    });

    widget.controller.addInsertOrAddListener(addInsertOrAddListener);

    super.initState();
  }

  @override
  void didChangeMetrics() {
    if (widget.isScroll) {
      widget.scrollController?.scrollToBottom();
    }
    super.didChangeMetrics();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  bool get _isBottom =>
      widget.scrollController!.offset ==
      widget.scrollController!.position.maxScrollExtent;

  bool get _isTop =>
      widget.scrollController!.offset ==
      widget.scrollController!.position.minScrollExtent;

  void _onScrollToBottomLoadMore() {
    widget.onScrollToBottomLoad?.call().then((hasMore) {
      if (!mounted) return;
      setState(() {
        _bottomHasMore = hasMore;
      });
    });
  }

  void _onScrollToTopLoadMore() {
    widget.onScrollToTopLoad?.call().then((hasMore) {
      if (!mounted) return;
      setState(() {
        _topHasMore = hasMore;
      });
    });
  }

  Widget _buildLoadMoreView() => Container(
        alignment: Alignment.center,
        height: 44,
        child: UnconstrainedBox(
          child: SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: widget.indicatorColor ?? context.theme.splashColor,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (v) {
        final pix = (widget.scrollController?.position.pixels ?? 0);
        final max = (widget.scrollController?.position.maxScrollExtent ?? 0);
        // ignore: avoid_print
        print('$pix $max');
        if ((widget.scrollController?.position.pixels ?? 0) > (widget.scrollController?.position.maxScrollExtent ?? 0)) {
          _isScollToBottom = true;
        }else {
          _isScollToBottom = (widget.scrollController?.position.maxScrollExtent ?? 0) == (widget.scrollController?.position.pixels ?? 0) ;
        }
      },
      child: CustomScrollView(
            center: centerKey,
            controller: widget.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            // reverse: true,
            // shrinkWrap: false,
            slivers: <Widget>[
              if (_topHasMore && widget.enabledTopLoad)
                SliverToBoxAdapter(child: _buildLoadMoreView()),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    return widget.itemBuilder(
                      context,
                      index,
                      widget.controller.topList.length - index - 1,
                      widget.controller.topList.elementAt(
                          widget.controller.topList.length - 1 - index),
                      // widget.controller.topList.elementAt(index),
                    );
                  },
                  childCount: widget.controller.topList.length,
                ),
              ),
    
              SliverList(
                key: centerKey,
                delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: index == widget.controller.bottomList.length - 1
                              ? 8.0
                              : 0),
                      child: Column(
                        children: [
                          widget.itemBuilder(
                            context,
                            index,
                            widget.controller.topList.length + index,
                            widget.controller.bottomList[index],
                          ),
                          // Text("${widget.controller.bottomList.last?.content}")
                        ],
                      ),
                    );
                  },
                  childCount: widget.controller.bottomList.length,
                ),
              ),
              // SliverToBoxAdapter(
              //   child: Text("widget.controller.bottomList ${widget.controller.bottomList.length}"),
              // ),
              if (_bottomHasMore && widget.enabledBottomLoad)
                SliverToBoxAdapter(child: _buildLoadMoreView()),
            ],
      ),
    );
  }
}

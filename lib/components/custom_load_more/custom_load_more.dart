import 'package:art_app/constants/assets.dart';
import 'package:art_app/extension/extension.dart';
import 'package:art_app/generated/locales.g.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_more_list/loading_more_list.dart';

class CustomLoadMore<T> extends StatefulWidget {
  final Widget Function(T, int) child;
  final Function? onLoad;
  final SliverGridDelegateWithMaxCrossAxisExtent? gridDelegate;
  // ignore: prefer_typing_uninitialized_variables
  final LoadingMoreBase<T> souceList;
  final EdgeInsets? padding;
  const CustomLoadMore(
      {super.key,
      required this.child,
      this.onLoad,
      required this.souceList,
      this.gridDelegate,
      this.padding});

  @override
  State<CustomLoadMore<T>> createState() => _CustomLoadMoreState<T>();
}

class _CustomLoadMoreState<T> extends State<CustomLoadMore<T>> {
  /// 是否第一次进入
  bool isFirst = true;
  final UniqueKey uniqueKey = UniqueKey();
  final controller = ScrollController();
  //you can use IndicatorWidget or build yourself widget
  //in this demo, we define all status.
  Widget _buildIndicator(BuildContext context, IndicatorStatus status) {
    //if your list is sliver list ,you should build sliver indicator for it
    //isSliver=true, when use it in sliver list
    bool isSliver = false;

    Widget widget;
    switch (status) {
      case IndicatorStatus.none:
        widget = Container(height: 0.0);
        break;
      case IndicatorStatus.loadingMoreBusying:
        widget = const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Container(
            //   margin: EdgeInsets.only(right: 5.0),
            //   height: 15.0,
            //   width: 15.0,
            //   child: getIndicator(context),
            // ),
            CupertinoActivityIndicator()
          ],
        );
        // widget = _setbackground(false, widget, 35.0);
        break;
      case IndicatorStatus.fullScreenBusying:
        widget = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
              child: Image.asset(Assets.assetsImagesNoEmptyV3),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 21.0),
              child: Text(
                '暂无数据',
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: context.customTheme?.subtitle),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(right: 0.0),
            //   height: 30.0,
            //   width: 30.0,
            //   child: getIndicator(context),
            // ),
            // Text("正在加载...不要着急")
          ],
        );
        // widget = _setbackground(true, widget, double.infinity);
        // ignore: dead_code
        if (isSliver) {
          widget = SliverFillRemaining(
            child: widget,
          );
        } else {
          widget = CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: <Widget>[
              SliverFillRemaining(
                child: widget,
              )
            ],
          );
        }
        break;
      case IndicatorStatus.error:
        widget = const Text(
          "好像出现了问题呢？",
        );
        // widget = _setbackground(false, widget, 35.0);

        widget = GestureDetector(
          onTap: () {
            // listSourceRepository.errorRefresh();
          },
          child: widget,
        );

        break;
      case IndicatorStatus.fullScreenError:
        widget = const Text(
          "好像出现了问题呢？",
        );
        // widget = _setbackground(true, widget, double.infinity);
        widget = GestureDetector(
          onTap: () {
            // listSourceRepository.errorRefresh();
          },
          child: widget,
        );
        // ignore: dead_code
        if (isSliver) {
          widget = SliverFillRemaining(
            child: widget,
          );
        } else {
          widget = CustomScrollView(
            slivers: <Widget>[
              SliverFillRemaining(
                child: widget,
              )
            ],
          );
        }
        break;
      case IndicatorStatus.noMoreLoad:
        widget = const Text('');
        // widget = _setbackground(false, widget, 35.0);
        break;
      case IndicatorStatus.empty:
        widget = EmptyWidget(
          "这里是空气！",
          emptyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                child: Image.asset(Assets.assetsImagesNoEmptyV3),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 21.0),
                child: Text(
                  '暂无数据',
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: context.customTheme?.subtitle),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 54),
              //   width: 156,
              //   height: 44,
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //       borderRadius: 24.radius,
              //       gradient: LinearGradient(
              //           colors: ['#FFF1E3'.color(), '#E9BF84'.color()])),
              //   child: Text(LocaleKeys.login.tr,
              //       style: context.textTheme.bodyMedium?.copyWith(
              //           fontSize: 14, color: context.customTheme?.btnSuccess)),
              // )
            ],
          ),
        );
        // widget = _setbackground(true, widget, double.infinity);
        // ignore: dead_code
        if (isSliver) {
          widget = SliverToBoxAdapter(
            child: widget,
          );
        } else {
          widget = CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: <Widget>[
              SliverFillRemaining(
                child: widget,
              )
            ],
          );
        }
        break;
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedVisibilityDetector(
      uniqueKey: uniqueKey,
      child: LoadingMoreList<T>(ListConfig<T>(
          padding: widget.padding ?? const EdgeInsets.all(0),
          indicatorBuilder: _buildIndicator,
          physics: const ClampingScrollPhysics(),
          gridDelegate: widget.gridDelegate,
          itemBuilder: (c, item, i) => Container(child: widget.child(item, i)),
          sourceList: widget.souceList)),
    );
  }
}

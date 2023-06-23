import 'package:art_app/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';

class MeView extends StatefulWidget {
  const MeView({super.key});

  @override
  State<MeView> createState() => _MeViewState();
}

class _MeViewState extends State<MeView> with AutomaticKeepAliveClientMixin {
  Widget buildPulltoRefreshImage([PullToRefreshScrollNotificationInfo? info]) {
    var offset = info?.dragOffset ?? 0.0;

    return SliverToBoxAdapter(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            height: 200.0 + offset,
            width: double.infinity,
            child: Image.asset(
              Assets.assetsImagesMeBg,
              //fit: offset > 0.0 ? BoxFit.cover : BoxFit.fill,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: PullToRefreshNotification(
        pullBackOnRefresh: true,
        maxDragOffset: double.infinity,
        // refreshOffset: 40,
        reachToRefreshOffset: 60,
        armedDragUpCancel: false,
        //pullBackCurve: TestCurve(),
        pullBackDuration: const Duration(milliseconds: 200),
        onRefresh: () async {
          return true;
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableClampingScrollPhysics(),
          slivers: <Widget>[
            PullToRefreshContainer(buildPulltoRefreshImage),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return Container(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "List item : ${10 - index}",
                        style: const TextStyle(fontSize: 15.0, inherit: false),
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 2.0,
                      )
                    ],
                  ));
            }, childCount: 10)),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:art_app/extension/extension.dart';
// import 'package:art_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 140,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: Swiper(
                    itemBuilder: (context, index) {
                      return ClipRRect(
                          borderRadius: 6.radius,
                          child: Image.network(
                            "https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/0af73890ecbf41edbbef8afb42ce6ffe~tplv-k3u1fbpfcp-no-mark:240:240:240:160.awebp?",
                            fit: BoxFit.fill,
                          ));
                    },
                    itemCount: 10,
                    itemWidth: double.infinity,
                    itemHeight: 280.0,
                    outer: false,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                  minHeight: 64, maxHeight: 100, minWidth: double.infinity),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 19.0, top: 0),
                  itemBuilder: (c, i) => Container(
                    margin: const EdgeInsets.only(right: 29),
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: 22.radius,
                            child: SizedBox(
                              width: 44,
                              height: 44,
                              child: Image.network(
                                "https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/0af73890ecbf41edbbef8afb42ce6ffe~tplv-k3u1fbpfcp-no-mark:240:240:240:160.awebp?",
                                fit: BoxFit.fill,
                              ),
                            ))
                      ],
                    ),
                  ),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              width: double.infinity,
              height: 78,
              child: Stack(
                children: [
                  
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (c, i) => ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 120,
                        minHeight: 78,
                        maxHeight: 120,
                        minWidth: 120,
                      ),
                      child: const Text('dd'),
                    )
                  ),
                  const SizedBox(child: Text('左边'),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:art_app/components/custom_img/custom_img.dart';
import 'package:art_app/components/custom_login/custom_login.dart';
import 'package:art_app/constants/assets.dart';
import 'package:art_app/extension/extension.dart';
import 'package:art_app/generated/locales.g.dart';
import 'package:art_app/models/product_get_product_list/product_get_product_list.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/views/me/controller/controller.dart';
import 'package:art_app/views/me/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeAllComponent extends StatefulWidget {
  final String? type;
  const MeAllComponent({super.key, this.type});

  @override
  State<MeAllComponent> createState() => _MeAllComponentState();
}

class _MeAllComponentState extends State<MeAllComponent>
    with AutomaticKeepAliveClientMixin {
  late final key = PageStorageKey(widget.type);
  ProductGetProductList? list = const ProductGetProductList();
  init() async {
    final _ = await MeServices.productGetProductList();
    LogUtil.w(_);
    setState(() {
      list = _.data!;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
    ever(MeController.to.loadings, (v) {
      if (v) {
        init();
      }
    });

    init();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomLoginWidget(
      notLoginWidget: Column(
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
              LocaleKeys.loginLookInformation.tr,
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: context.customTheme?.subtitle),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 54),
            width: 156,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: 24.radius,
                gradient: LinearGradient(
                    colors: ['#FFF1E3'.color(), '#E9BF84'.color()])),
            child: Text(LocaleKeys.login.tr,
                style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 14, color: context.customTheme?.btnSuccess)),
          )
        ],
      ),
      loginWidget: GridView.builder(
          key: key,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          physics: const ClampingScrollPhysics(),
          itemCount: 100,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: .756,
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemBuilder: (c, i) => Container(
                decoration: BoxDecoration(
                    borderRadius: 5.radius,
                    color: context.customTheme?.bottomBar),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4)),
                          child: SizedBox(
                            height: 168,
                            width: double.infinity,
                            child: const CustomImage(
                              url:
                                  'https://yanjie-prod-1318263237.cos.ap-shanghai.myqcloud.com/exhibition/paint/setting/1672794582259204096.jpg',
                              size: Size(168, 168),
                            ),
                          ),
                        ),

                        // 名称
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('熊猫嬉戏图',
                              style: context.textTheme.bodyMedium
                                  ?.copyWith(fontSize: 14)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text('共10个，1寄售',
                              style: context.textTheme.bodyMedium?.copyWith(
                                  fontSize: 12,
                                  color: context.customTheme?.subtitle)),
                        )
                      ],
                    )
                  ],
                ),
              )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

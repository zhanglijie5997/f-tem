import 'package:art_app/constants/assets.dart';
import 'package:art_app/extension/extension.dart';
import 'package:art_app/generated/locales.g.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        appBar: AppBar(
          toolbarHeight: 45,
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 73),
          width: context.mediaQuerySize.width,
          child: Column(
            children: [
              /// 顶部切换
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      child: Obx(
                    () => Column(
                      children: [
                        Text(LocaleKeys.login.tr,
                            style: context.textTheme.bodyLarge?.copyWith(
                                fontSize: 24,
                                fontWeight: controller.active == 0
                                    ? FontWeight.bold
                                    : FontWeight.w400,
                                color: controller.active == 1
                                    ? context.customTheme?.subtitle
                                    : context.textTheme.bodyLarge?.color)),
                        AnimatedOpacity(
                          opacity: controller.active == 0 ? 1 : 0,
                          duration: 300.milliseconds,
                          child: FittedBox(
                            child: Container(
                              height: 3,
                              decoration: BoxDecoration(
                                  borderRadius: 3.radius,
                                  // color: Colors.red,
                                  gradient: LinearGradient(
                                      tileMode: TileMode.repeated,
                                      colors: [
                                        '#E9BF84'.color(),
                                        '#FFF1E3'.color()
                                      ])),
                              child: Text(LocaleKeys.login.tr,
                                  style: context.textTheme.bodyLarge?.copyWith(
                                      fontSize: 24,
                                      fontWeight: controller.active == 0
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                      color: controller.active == 1
                                          ? context.customTheme?.subtitle
                                          : context
                                              .textTheme.bodyLarge?.color)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).onTap(() => controller.updateActive(0))),
                  Obx(() => Container(
                        margin: const EdgeInsets.only(left: 66),
                        child: Column(
                          children: [
                            Text(LocaleKeys.register.tr,
                                style: context.textTheme.bodyLarge?.copyWith(
                                    fontSize: 24,
                                    fontWeight: controller.active == 1
                                        ? FontWeight.bold
                                        : FontWeight.w400,
                                    color: controller.active == 0
                                        ? context.customTheme?.subtitle
                                        : context.textTheme.bodyLarge?.color)),
                            AnimatedOpacity(
                              opacity: controller.active == 1 ? 1 : 0,
                              duration: 300.milliseconds,
                              child: FittedBox(
                                child: Container(
                                  height: 3,
                                  decoration: BoxDecoration(
                                      borderRadius: 3.radius,
                                      // color: Colors.red,
                                      gradient: LinearGradient(
                                          tileMode: TileMode.repeated,
                                          colors: [
                                            '#E9BF84'.color(),
                                            '#FFF1E3'.color()
                                          ])),
                                  child: Text(LocaleKeys.register.tr,
                                      style: context.textTheme.bodyLarge
                                          ?.copyWith(
                                              fontSize: 24,
                                              color: context
                                                  .customTheme?.subtitle)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ).onTap(() => controller.updateActive(1))),
                ],
              ),
              // 登陆
              Container(
                width: context.mediaQuerySize.width * .92,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                    // color: Colors.red,
                    color: context.customTheme?.bottomBar,
                    borderRadius: 27.radius),
                margin: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('+86', style: context.textTheme.bodyLarge),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        // height: 16,
                        child: TextSelectionTheme(
                          data: context.theme.textSelectionTheme,
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            showCursor: true,
                            maxLength: 11,
                            onChanged: controller.updatePhone,
                            // cursorColor: Colors.red,
                            controller: controller.phoneController,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: '请输入手机号', counterText: ''),
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              // 密码
              Container(
                width: context.mediaQuerySize.width * .92,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                    // color: Colors.red,
                    color: context.customTheme?.bottomBar,
                    borderRadius: 27.radius),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: SizedBox(
                        // height: 16,
                        child: TextSelectionTheme(
                          data: context.theme.textSelectionTheme,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            showCursor: true,
                            maxLength: 6,
                            onChanged: controller.updateCode,
                            // cursorColor: Colors.red,
                            controller: controller.codeController,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: '请输入验证码', counterText: ''),
                          ),
                        ),
                      ),
                    )),
                    Container(
                      width: 1,
                      height: 17,
                      color: '#BCB8C5'.color(),
                    ),
                    Container(
                      // width: 80,
                      padding: const EdgeInsets.only(left: 23.0, right: 10),
                      child: Obx(
                        () => Text(
                                controller.times == 120
                                    ? '发送验证码'
                                    : '${controller.times}s',
                                style: context.textTheme.bodyMedium?.copyWith(
                                    color: context.customTheme?.success,
                                    fontSize: 14))
                            .onTap(controller.showCaptcha),
                      ),
                    )
                  ],
                ),
              ),
              // 分享码
              Obx(() => AnimatedSwitcher(
                  duration: 300.milliseconds,
                  child: controller.active == 1
                      ? Container(
                          width: context.mediaQuerySize.width * .92,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              color: context.customTheme?.bottomBar,
                              borderRadius: 27.radius),
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: SizedBox(
                                  // height: 16,
                                  child: TextSelectionTheme(
                                    data: context.theme.textSelectionTheme,
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      showCursor: true,
                                      onChanged: controller.updateInviteCode,
                                      // cursorColor: Colors.red,
                                      controller:
                                          controller.inviteCodeController,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '输入分享码（选填）'),
                                    ),
                                  ),
                                ),
                              )),
                            ],
                          ),
                        )
                      : const SizedBox())),

              Obx(
                  () => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    decoration: BoxDecoration(
                        color: controller.validate ? Colors.transparent : context.customTheme?.btnDisabled,
                        borderRadius: 27.radius, gradient: controller.validate ? LinearGradient(
                        tileMode: TileMode.repeated,
                        colors: [
                          '#E9BF84'.color(),
                          '#FFF1E3'.color().withAlpha(0)
                        ]) : null),
                    child: Text(
                      LocaleKeys.login.tr,
                      style: context.textTheme.bodyLarge,
                    )),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                      child: Image.asset(Assets.assetsImagesIconIconChecked),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text.rich(TextSpan(
                          style: context.textTheme.bodyMedium
                              ?.copyWith(color: context.customTheme?.subtitle),
                          text: '我已阅读并同意',
                          children: [
                            TextSpan(
                                text: '《用户服务协议》',
                                style: context.textTheme.bodyMedium?.copyWith(
                                    color: context.customTheme?.success),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    /// TODO: 打开用户服务协议
                                  }),
                            const TextSpan(text: '及'),
                            TextSpan(
                                text: '《隐私政策》',
                                style: context.textTheme.bodyMedium?.copyWith(
                                    color: context.customTheme?.success),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    /// TODO: 隐私政策
                                  }),
                          ])),
                    )
                  ],
                ),
              ),
            ],
          ),
        )).onTap(() {
          FocusScope.of(context).unfocus();
    });
  }
}

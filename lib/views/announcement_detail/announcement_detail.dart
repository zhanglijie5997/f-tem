import 'package:art_app/extension/context/context.dart';
import 'package:art_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

class AnnouncementDetailView extends GetView<AnnouncementDetailController> {
  const AnnouncementDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: context.theme.scaffoldBackgroundColor.withAlpha(0),

        appBar: AppBar(
            toolbarHeight: 45, title: Text(LocaleKeys.announcementDetail.tr)),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('公告标题',
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontSize: 22, fontWeight: FontWeight.bold)),

              /// 时间
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text('2022-10-20 13:21:21',
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: context.customTheme?.subtitle, fontSize: 14)),
              ),
              const Divider(
                height: 1,
              ),

              Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => HtmlWidget(
                      '''
                      <body>
                      ${controller.data.data?.content}
                      </body>
                      ''',
                      textStyle: context.textTheme.bodyLarge
                          ?.copyWith(color: Colors.white, fontSize: 16),
                    ),
                  ))
            ],
          ),
        )));
  }
}

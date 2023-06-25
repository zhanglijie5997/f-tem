import 'package:art_app/router/router.dart';
import 'package:art_app/services/global/global.services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthorMiddlewares extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    Get.log(route!);
    if (GlobalServiceController.to.token.isEmpty) {
      return RouteSettings(name: RoutesName.login);
    }
    // if (!AuthService.to.isLoggedInValue.value) {
    //   Future.delayed(const Duration(milliseconds: 500), () {
    //     Get.snackbar("tips", "login", backgroundColor: Colors.white);
    //   });
    //   return RouteSettings(name: Routes.login);
    // }
    return null;
  }
}

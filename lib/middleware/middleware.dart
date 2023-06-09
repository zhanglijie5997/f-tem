import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthorMiddlewares extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    Get.log(route!);
    // if (!AuthService.to.isLoggedInValue.value) {
    //   Future.delayed(const Duration(milliseconds: 500), () {
    //     Get.snackbar("tips", "login", backgroundColor: Colors.white);
    //   });
    //   return RouteSettings(name: Routes.login);
    // }
    return null;
  }
}

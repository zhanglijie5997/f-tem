import 'package:get/get.dart';

import 'global/global.services.dart';
import 'language/language.services.dart';
import 'theme/theme.services.dart';

class AppServices {
  static init() async {
    Get.put(GlobalServiceController(), permanent: true);
    Get.put(ThemeService(), permanent: true);
    Get.put(LanguageService(), permanent: true);
  }
}

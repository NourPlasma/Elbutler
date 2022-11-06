import 'package:ebutler_task/base/app_const/colors.dart';
import 'package:ebutler_task/base/app_const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'base/bindings.dart';
import 'base/controllers/local/local_translations.dart';
import 'base/controllers/navigation/navigation_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // pref init

  await GetStorage.init();

  //***************************************************************************************************************

  // run app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GetStorage getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EButler Task',
      debugShowCheckedModeBanner: false,
      translations: LocalTranslations(),
      locale: Locale(getStorage.read('currentLocale') ?? 'en', ''),
      initialBinding: MainBindings(),
      defaultTransition: Transition.fade,
      getPages: NavigationController.getRouters(),
      fallbackLocale: const Locale('ar', ''),
      initialRoute: _getInitRoute(),
      theme: ThemeData(fontFamily: AppConst.robotoFamily).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
            primary: AppColors.colorBlack1,
            secondary: AppColors.colorBlack1),
      ),
    );
  }

  String _getInitRoute() {
    String initRoute;
    if (getStorage.read('isLogin') ?? false) {
      var now = DateTime.now();
      String lastTimeActive = getStorage.read('lastTimeActive');
      DateTime parseLastTimeActive = DateTime.parse(lastTimeActive);
      var plus1Hour = parseLastTimeActive.add(const Duration(hours: 1));

      if (now.isAfter(plus1Hour)) {
        initRoute = '/auth';
      } else {
        initRoute = '/users';
      }
    } else {
      initRoute = '/auth';
    }
    return initRoute;
  }
}

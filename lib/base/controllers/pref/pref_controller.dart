import 'package:get_storage/get_storage.dart';

class PrefController {
  GetStorage? _getStorage;

  PrefController() {
    _getStorage = GetStorage();
  }

  // is login
  bool get isLogin => _getStorage!.read('isLogin') ?? false;
  set isLogin(bool value) => _getStorage!.write('isLogin', value);

  // current locale
  String get currentLocale => _getStorage!.read('currentLocale') ?? 'en';
  set currentLocale(String value) => _getStorage!.write('currentLocale', value);

  // last time active
  String get lastTimeActive => _getStorage!.read('lastTimeActive') ?? '';
  set lastTimeActive(String value) => _getStorage!.write('lastTimeActive', value);
}

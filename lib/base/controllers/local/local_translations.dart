import 'package:get/get.dart';

class AppLocalKeys {
  static const String welcome = 'welcome';
  static const String invalidEmailMsg = 'invalidEmailMsg';
  static const String invalidPasswordMsg = 'invalidPasswordMsg';
  static const String email = 'email';
  static const String password = 'password';
  static const String login = 'login';
  static const String loginSuccess = 'loginSuccess';
  static const String success = 'success';
  static const String error = 'error';
  static const String loading = 'loading';
  static const String users = 'users';
  static const String tryAgain = 'tryAgain';
  static const String addLocation = 'addLocation';
  static const String addUser = 'addUser';
  static const String editUser = 'editUser';
  static const String submit = 'submit';
  static const String imgDialogMsg = 'imgDialogMsg';
  static const String gallery = 'gallery';
  static const String camera = 'camera';
  static const String add = 'add';
  static const String userDetails = 'userDetails';
  static const String locations = 'locations';
  static const String locationsList = 'locationsList';
  static const String delete = 'delete';
  static const String go = 'go';
}

class LocalTranslations extends Translations {
  final enMap = {
    AppLocalKeys.welcome: 'Welcome',
    AppLocalKeys.invalidEmailMsg: 'please enter a valid email !',
    AppLocalKeys.invalidPasswordMsg:
        'password must be more or equal 6 characters !',
    AppLocalKeys.email: 'Email',
    AppLocalKeys.password: 'Password',
    AppLocalKeys.login: 'Login',
    AppLocalKeys.success: 'Success',
    AppLocalKeys.loginSuccess: 'Login Successfully',
    AppLocalKeys.error: 'ُError',
    AppLocalKeys.loading: 'Loading',
    AppLocalKeys.users: 'Users',
    AppLocalKeys.tryAgain: 'Try Again',
    AppLocalKeys.addLocation: 'Add Location',
    AppLocalKeys.addUser: 'Add User',
    AppLocalKeys.editUser: 'Edit User',
    AppLocalKeys.submit: 'Submit',
    AppLocalKeys.imgDialogMsg: 'Choose Image From :',
    AppLocalKeys.camera: 'Camera',
    AppLocalKeys.gallery: 'Gallery',
    AppLocalKeys.add: 'Add',
    AppLocalKeys.userDetails: 'User Details',
    AppLocalKeys.locations: 'Locations',
    AppLocalKeys.locationsList: 'Locations List',
    AppLocalKeys.delete: 'Delete',
    AppLocalKeys.go: 'GO',
  };

  final arMap = {
    AppLocalKeys.welcome: 'اهلا',
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'en': enMap,
        'ar': arMap,
      };
}

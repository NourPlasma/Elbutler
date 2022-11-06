
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UtilsController {
  //Screen Width
  double getWidth({double dividedBy = 1}) => Get.width / dividedBy;

  //Screen High
  double getHigh({double dividedBy = 1}) => Get.height / dividedBy;

  //Email Validators
  bool isEmail({required String email}) => GetUtils.isEmail(email);

  //Url Validators
  bool isUrl({required String url}) => GetUtils.isURL(url);

  //Username Validators
  bool isUsername({required String username}) => GetUtils.isUsername(username);

  //DateTime Validators
  bool isDateTime({required String date}) => GetUtils.isDateTime(date);

  //Num Validators
  bool isNum({required String num}) => GetUtils.isNum(num);

  //Phone Validators
  bool isPhone({required String phone}) => GetUtils.isPhoneNumber(phone);

  //Matching Validators
  bool isMatch({required String text, required String pattern}) =>
      GetUtils.hasMatch(text, pattern);

  //Platform Validators
  bool isAndroid() => GetPlatform.isAndroid;

  //Clear Focus Node
  void clearFocus() => FocusManager.instance.primaryFocus?.unfocus();

  //Landscape Validators
  bool isLandscape(BuildContext context) => context.isLandscape;

  //Tablet Validators
  bool isTablet(BuildContext context) => context.isTablet;

  //Share
  // void shareMsg({required String msg, required String subject}) =>
  //     Share.share(msg, subject: subject);

  //Launch Url
  // Future<bool> urlLaunch({required String url}) async =>
  //     await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  // //Launch Whatsapp
  // Future<bool> whatsAppLaunch({required String phone,required String msg}) async =>
  //     await canLaunch('whatsapp://send?phone=+966$phone&text=$msg') ? await launch('whatsapp://send?phone=+966$phone&text=$msg') : throw 'Could not launch whatsapp://send?phone=+966$phone&text=$msg';

  //Launch Youtube
  // Future<void> youtubeLaunch({required String url}) async {
  //   if (GetPlatform.isIOS) {
  //     if (await canLaunch(url)) {
  //       await launch(url, forceSafariVC: false);
  //     } else {
  //       if (await canLaunch(url)) {
  //         await launch(url);
  //       } else {
  //         throw 'Could not launch $url';
  //       }
  //     }
  //   } else {
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   }
  // }

  //Call Phone
  // Future<bool> callPhone({required String phone}) async => await canLaunch('tel:$phone')
  //     ? await launch('tel:$phone')
  //     : throw 'Could not call $phone';

  //Send Mail
  // Future<bool> sendMail({required String email, required String subject, required String body}) async =>
  //     await canLaunch('mailto:$email?subject=$subject&body=$body')
  //         ? await launch('mailto:$email?subject=$subject&body=$body')
  //         : throw 'Could not send email to $email';

  // Send SMS
  // Future<bool> sendSMS({required String phone}) async => await canLaunch('sms:$phone')
  //     ? await launch('sms:$phone')
  //     : throw 'Could not call $phone';


  // // 24 to 12
  // String utcTo12HourFormat(String bigTime) {
  //   DateTime tempDate = DateFormat("hh:mm").parse(bigTime);
  //   var dateFormat = DateFormat("h:mm a"); // you can change the format here
  //   var utcDate = dateFormat.format(tempDate); // pass the UTC time here
  //   var localDate = dateFormat.parse(utcDate, true).toLocal().toString();
  //   String createdDate = dateFormat.format(DateTime.parse(localDate));
  //   return createdDate;
  // }
}

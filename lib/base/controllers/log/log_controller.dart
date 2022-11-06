
import 'package:logger/logger.dart';

class LogController {
  Logger? logger;

  LogController() {
    logger = Logger(
        printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 5,
          lineLength: 50,
        )
    );
  }

  //log v
  void grey({required String msg}) => logger!.v(msg);

  //log d
  void white({required String msg}) => logger!.d(msg);

  //log i
  void blue({required String msg}) => logger!.i(msg);

  //log w
  void orange({required String msg}) => logger!.w(msg);

  //log e
  void red({required String msg}) => logger!.e(msg);

}

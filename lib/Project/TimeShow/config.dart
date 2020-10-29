import 'package:package_info/package_info.dart';
import 'package:logging/logging.dart';
class TsConfig {
  static PackageInfo packageInfo;
  static var domain = 'timeshow.app';
  static var apiBaseUrl = 'http://lovelive.ink:7110';
  static var debug = false;
  static var loggingLevel = Level.INFO;
  static var isLogAction = false;
  static var isLogApi = false;
  static var isMockApi = false;
}
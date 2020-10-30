import 'package:package_info/package_info.dart';
import 'package:logging/logging.dart';
class BlogConfig {
  static PackageInfo packageInfo;
  static var domain = 'bqbbq.com';
  static var wgApiBaseUrl = 'https://$domain/api';
  static var debug = false;
  static var loggerLevel = Level.INFO;
  static var isLogAction = false;
  static var isLogApi = false;
  static var isMockApi = false;
}
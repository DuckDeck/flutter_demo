import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_demo/Project/Blog/Model/state/app.dart';
import 'package:flutter_demo/Project/Blog/Reducers/reducer.dart';
import 'package:flutter_demo/Project/Blog/Service/service.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:package_info/package_info.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux_thunk/redux_thunk.dart';

class BlogFactory {
  static BlogFactory _instance;

  Map<String, Logger> _loggers = {};
  Store<AppState> _store;
  PersistCookieJar _cookieJar;
  BlogService _service;
  BlogFactory._();
  factory BlogFactory(){
    if(_instance == null){
      _instance = BlogFactory._();
    }
    return _instance;
  }


  Logger getLogger(String name) {
    if (_loggers[name] == null) {
      Logger.root.level = BlogConfig.loggerLevel;
      final logger = Logger(name);
      logger.onRecord
          .where((record) => record.loggerName == logger.name)
          .listen((record) {
        final label =
            record.loggerName.padRight(7).substring(0, 7).toUpperCase();
        final time = record.time.toIso8601String().substring(0, 23);
        final level = record.level.toString().padRight(7);
        print('$label $time $level ${record.message}');
      });
      _loggers[name] = logger;
    }
    return _loggers[name];
  }



    Future<Store<AppState>> getStore() async {
     
    if (_store == null) {
      final persistor = Persistor<AppState>(
        storage: FlutterStorage(key: BlogConfig.packageInfo.packageName),
        serializer: JsonSerializer<AppState>((json) {
          if (json == null) {
            return AppState();
          }
          return AppState.fromJson(json);
        }),
        transforms: Transforms(
          onLoad: [
            (state) {
              if (compareVersion(
                      state.version, BlogConfig.packageInfo.version, 2) !=
                  0) {
                state = AppState();
              }
              return state;
            }
          ],
        ),
      );

      final initialState = await persistor.load();

      final List<Middleware<AppState>> wms = [];
      if (BlogConfig.isLogAction) {
        wms.add(LoggingMiddleware<AppState>(
            logger: getLogger('action'), level: Level.FINE));
      }
      wms.addAll([
        thunkMiddleware,
        persistor.createMiddleware(),
      ]);

      _store = Store<AppState>(
        appReducer,
        initialState: initialState ?? AppState(),
        middleware: wms,
      );
    }

    return _store;
  }

  Future<PersistCookieJar> getCookieJar() async {
    if (_cookieJar == null) {
      var docDir = await getApplicationDocumentsDirectory();
      _cookieJar = PersistCookieJar(dir: '${docDir.path}/cookies');
    }
    return _cookieJar;
  }

  Future<BlogService> getService() async {
    if (_service == null) {
      var cookieJar = await getCookieJar();
      _service = BlogService(cookieJar);
    }
    return _service;
  }

}

int compareVersion(String version1, String version2, [int length = 3]) {
  var v1 = version1.split('.')
    ..remove('')
    ..addAll(List<String>.filled(length, '0'))
    ..sublist(0, length);
  var v2 = version2.split('.')
    ..remove('')
    ..addAll(List<String>.filled(length, '0'))
    ..sublist(0, length);

  for (var i in List<int>.generate(length, (i) => i)) {
    var v11 = int.parse(v1[i]);
    var v22 = int.parse(v2[i]);
    if (v11 > v22) {
      return 1;
    } else if (v11 < v22) {
      return -1;
    }
  }
  return 0;
}

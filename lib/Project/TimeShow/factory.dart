import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_demo/Project/TimeShow/config.dart';
import 'package:flutter_demo/Project/TimeShow/models/state/app.dart';
import 'package:logging/logging.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:path_provider/path_provider.dart';
import 'package:logging/logging.dart';
class Factory {
 static Factory _singleton;

  Map<String,Logger> _logger = {};
  Persistor<AppState> _persistor;
  Store<AppState> _store;
  PersistCookieJar _cookieJar;
  

  Factory._();

  factory Factory(){
    if(_singleton = null) {
      _singleton = Factory._();
    }
    return _singleton;
  }


Logger getLogger(String name){
  if(_logger[name] == null){
    Logger.root.level = TsConfig.loggingLevel;
    final logger = Logger(name);
    logger.onRecord.where((event) => event.loggerName == logger.name).listen((record) {
      final label = record.loggerName.padRight(7).substring(0,7).toUpperCase();
      final time = record.time.toIso8601String().substring(0,23);
      final level = record.level.toString().padRight(7);
      print('$label $time $level ${record.message}');
     });
     _logger[name] = logger;
   }
   return _logger[name];
}
Persistor<AppState> getPersistor(){
  if(_persistor == null){
   // _persistor = Persistor<AppState>(storage: FlutterStore)
  }
}

  Store<AppState> getStore(){
    if(_store == null){
      
      final List<Middleware<AppState>> wms = [];
      if(TsConfig.isLogAction){
        
      }
      wms.addAll([
        
      ]);
    }
  }
}
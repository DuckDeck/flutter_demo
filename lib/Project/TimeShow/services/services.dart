import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_demo/Project/TimeShow/config.dart';
import 'package:flutter_demo/Project/TimeShow/factory.dart';

class TsApiResponse {
  static const int codeResponseError = -2;
  static const int codeRequestError = -1;
  static const int codeOk = 0;
  final int code;
  final String message;
  final Map<String,dynamic> data;


  TsApiResponse({
    this.code = codeOk,
    this.message = '',
    this.data,
      });


}

class TsSerivice {
   
  final _client = Dio();
  final _logger = Factory().getLogger("TsSerivice");
  TsSerivice(PersistCookieJar cookieJar){
    
    _client.options.baseUrl = TsConfig.apiBaseUrl;
    _client.interceptors.addAll(CookieManager(cookieJar));
  }

  Future<TsApiResponse> request(String method,String path,{dynamic data}) async{
    if(TsConfig.isLogApi){
      _logger.fine("request: $method $path");
    }
    var response = Reponse()
  }

  Future<TsApiResponse> get(String path, {Map<String, dynamic> data}) async {
    return request('GET', path, data: data);
  }

  Future<TsApiResponse> post(String path, {Map<String, dynamic> data}) async {
    return request('POST', path, data: data);
  }

  Future<TsApiResponse> postForm(String path, {FormData data}) async {
    return request('POST', path, data: data);
  }
}
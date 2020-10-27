import 'package:dio/dio.dart';
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
  final _logger = Factory()
}
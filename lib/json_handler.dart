library json_handler;

import 'package:dio/dio.dart';

class JSONHandler {

  var _response = Response();
  final _dio = Dio();

  final data = 'API is not invoked';

  Future getData(String url) async {
    _response = await _dio.get(url);
    try {
      _response = await _dio.get(url);
      if (_response.statusCode == 200) {
        return _response.data;
      } else {
        return 'error occurred';
      }
    } catch (e) {
      return 'unexpected error occurred';
    }
  }

  Future postData(String url, [Map postJSON , String authToken = '0', Map header,]) async{
    try {
      if(authToken != '0'){
        _dio.options.headers['Authorization'] = authToken;
      }
      _response = await _dio.post(url, data: postJSON);
      if (_response.statusCode == 200) {
        return _response.data;
      } else {
        return 'error occurred';
      }
    } catch (e) {
      return 'unexpected error occurred';
    }
  }
}
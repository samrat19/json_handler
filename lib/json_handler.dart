library json_handler;

import 'package:dio/dio.dart';

class JSONHandler {
  var _response = Response();
  final _dio = Dio();

  final data = 'API is not invoked';

  ///[*] the [getData] method get Data from an API
  ///[*] if fails to get data it will throw an [error]
  ///[*] this method must needs an [url] and it also accepts [header]

  Future getData({String url, Map header}) async {
    //checks the provided url is null or not

    if (url == null) {
      return 'URL can not be null';
    } else {
      if (header != null) {
        try {
          _dio.options.headers = Map<String, dynamic>.from(header);
          _response = await _dio.get(url);
          print(_response.statusCode.toString());
          if (_response.statusCode == 200) {
            return _response.data;
          } else {
            return 'error occurred';
          }
        } on DioError catch (error) {
          if (error.type == DioErrorType.CONNECT_TIMEOUT) {
            return 'Connection Time Out';
          } else {
            return 'Unexpected error occurred';
          }
        }
      } else {
        _response = await _dio.get(url);
        try {
          _response = await _dio.get(url);
          if (_response.statusCode == 200) {
            return _response.data;
          } else {
            return 'error occurred';
          }
        } on DioError catch (error) {
          if (error.type == DioErrorType.CONNECT_TIMEOUT) {
            return 'Connection Time Out';
          } else {
            return 'Unexpected error occurred';
          }
        }
      }
    }
  }

  Future postData({
    String url,
    Map postJSON,
    String authToken = '0',
    Map header,
  }) async {
    try {
      if (authToken != '0') {
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

import 'dart:developer';
import 'package:json_handler/json_handler.dart';

void main() async{
  var jsonHandler = JSONHandler();
  var response = await jsonHandler.getData(url:'https://jsonkeeper.com/b/DNP6');
  log(response.toString());
}

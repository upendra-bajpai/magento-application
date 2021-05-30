import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:magento_mobile/constants.dart';
import 'dart:convert';
import 'dart:async';
import 'app_exceptions.dart';

class ApiBaseHelper {
  final String _baseUrl = "http://api.themoviedb.org/3/";

  Future<dynamic> get(Uri url,{Map<String,String> headers}) async {
    print('Api Get, urls $url');
    var responseJson;
    try {
      if(headers==null)
        headers={'Authorization':TOKEN,'accept': 'application/json'};
      final response = await http.get( url, headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    print('Api Post, url $url');
    var responseJson;
    try {
      final response = await http.post( Uri.parse(url),
      headers: {'Content-Type': 'application/json'}, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put( Uri.parse(url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(_baseUrl + url));
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  print("Your response is ${response.request.url} -> ${response.body.toString()}");
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      //print(responseJson.toString());
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      return response;
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}

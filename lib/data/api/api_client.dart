import 'dart:convert';

import 'package:get/get.dart';
import 'package:foodordering/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late SharedPreferences sharedPreferences;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    // token=AppConstants.TOKEN;
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? "";
    // token = sharedPreferences.getString(AppConstants.TOKEN)!; give error null

   // token = sharedPreferences.getString(AppConstants.TOKEN)!;

    _mainHeaders = {
      "HttpHeaders.contentTypeHeader": "application/json",
      'Accept': 'application/json',
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  void updateHeader(String token){
    _mainHeaders = {
      "HttpHeaders.contentTypeHeader": "application/json",
      'Accept': 'application/json',
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  Future<Response> getData(
    String uri,{Map<String,String>?headers}
  ) async {
    print(headers.toString());
    try {
      Response response = await get(uri,headers:headers??_mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1,statusText: e.toString());
    }
  }
  Future<Response>postData(String uri,dynamic body)async{
    print(body.toString());
    try{
      Response response= await post(uri,body,headers: _mainHeaders);
      print(response.toString());
      return response;
    }catch(e){
      print(e.toString());
      return Response(statusCode:1,statusText:e.toString());
    }
  }

//
// // Create storage
//   final storage = new FlutterSecureStorage();
//
// // Unique key for token
//   final TOKEN = 'token';
//
// // Write token value
//   await storage.write(this.appBaseUrl, key: TOKEN , value: token);
//
// // Read token value
//   String value = await storage.read(key: keyToken );
}

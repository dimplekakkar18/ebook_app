import 'dart:convert';
import 'dart:io';
import 'package:ebook_app/utils/constants.dart';
import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'failure.dart';

class CustomHttpClient {
  final String _baseURL;
  final Client _client;
  final FlutterSecureStorage _secureStorage;
  CustomHttpClient(this._baseURL, this._client, this._secureStorage);

  // Sample getRequest Function
  Future<dynamic> getCategoriesList(String studentID, String staticId) async {
    try {
      var response = await _client.get(
        Uri.parse("$_baseURL/stall/get_categories?static_id=$staticId"),
        headers: {
          'X-Authorization': xAuthorization,
          'X-ORIGIN': xOrigin,
          'X-STUDENT-ID': studentID
        },
      );
      // print(
      //     "response is ${response.body}, ${response.statusCode}, ${response.request}");
      if (response.statusCode != 200) throw Failure('error occured $response');
      return json.decode(response.body);
    } on SocketException {
      throw Failure('Internet connection error');
    } on HttpException {
      throw Failure('Couldn\'t fetch data');
    } on FormatException {
      throw Failure('Response format error');
    } on ClientException {
      throw Failure('Connection Interrupted');
    }
  }

  // Sample postRequest Function
  Future<dynamic> postRequest(
      String path, String studentID, Map<String, dynamic> body) async {
    try {
      var response = await _client.post(
        Uri.parse(_baseURL + path),
        headers: {
          'X-Authorization': xAuthorization,
          'X-ORIGIN': xOrigin,
          'X-STUDENT-ID': studentID
        },
        body: body,
      );
      print(
          "response is ${response.body}, ${response.statusCode}, ${response.request}");
      if (response.statusCode != 200) throw Failure('error occured $response');
      return json.decode(response.body);
    } on SocketException {
      throw Failure('Internet connection error');
    } on HttpException {
      throw Failure('Couldn\'t fetch data');
    } on FormatException {
      throw Failure('Response format error');
    } on ClientException {
      throw Failure('Connection Interrupted');
    }
  }
}

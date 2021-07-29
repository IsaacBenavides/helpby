import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mydoctor/api/repositories/data_local_repository.dart';

class ApiBaseHelper {
  ApiBaseHelper._();
  // These methods are responsible for making all requests. so far there are only the get and post but when required the others are added

  static final ApiBaseHelper instance = ApiBaseHelper._();

  Future<String> getHttp(url) async {
    try {
      final resp = await http.get(url, headers: await header());

      var statusCode = resp.statusCode;
      if (statusCode == 200) {
        final decData = json.decode(resp.body);
        return decData;
      } else {
        throw Exception('Failed to load Information');
      }
    } on TimeoutException catch (e) {
      return "The connection took a long time. Check your internet connection.";
    }
  }

  Future<dynamic> postHttp({String url, Map body}) async {
    try {
      final resp = await http.post(url,
          headers: await header(), body: json.encode(body));
      final decData = json.decode(resp.body) as Map;
      final key = decData.keys.toList()[0];
      var statusCode = resp.statusCode;

      if (statusCode == 200) {
        // a list is passed with the statusCode and the body of the response to be able to use the response from the api
        // in case the request is incorrect and thus use it to display on the screen
        return ([statusCode, decData[key]]);
      } else {
        return ([statusCode, decData[key][0]]);
      }
    } on TimeoutException catch (e) {
      return "The connection took a long time. Check your internet connection.";
    }
  }

  Future<dynamic> putHttp({String url, Map body}) async {
    try {
      final resp =
          await http.put(url, headers: await header(), body: json.encode(body));
      final decData = json.decode(resp.body) as Map;
      final key = decData.keys.toList()[0];
      var statusCode = resp.statusCode;
      if (statusCode == 200) {
        // a list is passed with the statusCode and the body of the response to be able to use the response from the api
        // in case the request is incorrect and thus use it to display on the screen
        return ([statusCode, decData[key]]);
      } else {
        return ([statusCode, decData[key][0]]);
      }
    } on TimeoutException catch (e) {
      return "The connection took a long time. Check your internet connection.";
    }
  }

  Future<dynamic> patchHttp({String url, Map body}) async {
    try {
      final resp = await http.patch(url,
          headers: await header(), body: json.encode(body));
      final decData = json.decode(resp.body) as Map;
      final key = decData.keys.toList()[0];
      var statusCode = resp.statusCode;
      if (statusCode == 200) {
        // a list is passed with the statusCode and the body of the response to be able to use the response from the api
        // in case the request is incorrect and thus use it to display on the screen
        return ([statusCode, decData[key]]);
      } else {
        return ([statusCode, decData[key][0]]);
      }
    } on TimeoutException catch (e) {
      return "The connection took a long time. Check your internet connection.";
    }
  }

  Future<String> deleteHttp(url) async {
    try {
      final resp = await http.delete(url, headers: await header());

      var statusCode = resp.statusCode;
      if (statusCode == 200) {
        final decData = json.decode(resp.body);
        return decData;
      } else {
        throw Exception('Failed to delete Information');
      }
    } on TimeoutException catch (e) {
      return "The connection took a long time. Check your internet connection.";
    }
  }
}

header() async {
  var getToken = await LocalDataRepository.instance.getTokenStorage();

  if (getToken != null) {
    return {
      'Content-type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: getToken
    };
  } else {
    return {
      'Content-type': 'application/json; charset=UTF-8',
    };
  }
}

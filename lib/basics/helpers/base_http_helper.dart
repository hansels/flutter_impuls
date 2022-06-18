import 'dart:convert';

import 'package:flutter_impuls/basics/exceptions/http_exception.dart';
import 'package:http/http.dart' as http;

abstract class BaseHTTPHelper {
  String get route;

  Future<Map<String, dynamic>> post({
    String json,
    String link,
    String token,
  }) async {
    try {
      Map<String, String> headers = {"content-type": "application/json"};
      if (token != null && token.isNotEmpty) {
        headers["Authorization"] = "Bearer $token";
      }
      var response = await http.post(
        Uri.parse(link),
        body: json,
        headers: headers,
      );
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        return map['data'];
      } else {
        throw HTTPException.fromHTTPError(jsonDecode(response.body));
      }
    } on HTTPException {
      rethrow;
    } catch (err) {
      throw HTTPException.fromError(err as Error);
    }
  }

  Future<void> postVoid({
    String json,
    String link,
    String token,
  }) async {
    try {
      Map<String, String> headers = {"content-type": "application/json"};
      if (token != null && token.isNotEmpty) {
        headers["Authorization"] = "Bearer $token";
      }
      var response = await http.post(
        Uri.parse(link),
        body: json,
        headers: headers,
      );
      if (response.statusCode == 200) {
        return;
      } else {
        throw HTTPException.fromHTTPError(jsonDecode(response.body));
      }
    } on HTTPException {
      rethrow;
    } catch (err) {
      throw HTTPException.fromError(err as Error);
    }
  }
}

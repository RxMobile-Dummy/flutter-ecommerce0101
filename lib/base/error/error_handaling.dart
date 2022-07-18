import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

getError(http.Response response) {
  switch (response.statusCode) {
    case 400:
      debugPrint(jsonDecode(response.body)['msg'].toString());
      return jsonDecode(response.body)['msg'];
    case 500:
      debugPrint(jsonDecode(response.body)['error']);
      return jsonDecode(response.body)['error'];
    default:
      return "problem";
  }
}

// import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  /* http package  */
  var url = "https://eunjin3786.pythonanywhere.com/question/all/";
  var response = await http.get(url);

  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  var responseBody = response.body;

  print("statusCode: ${statusCode}");
  print("responseHeaders: ${responseHeaders}");
  // print("responseBody: ${responseBody}");
}

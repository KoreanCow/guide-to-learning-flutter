import 'dart:convert';
import 'dart:io';

void main() {
  String jsonStr = """
  {
    "basket" : {
      "apple" : 50,
      "banana" : 10,
      "grape" : 5,
    }
  }
  """;

  Map json = jsonDecode(jsonStr);
  Map basket = json["basket"];
  int apples = baseket
}

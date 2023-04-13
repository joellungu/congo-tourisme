import 'dart:convert';
import 'package:get/get.dart';
//import 'package:http/http.dart' as http;

class Requete extends GetConnect {
  String url = "http://10.0.2.2:8080";
  //String url = "http://192.168.162.134:8080";
  //String url = "http://localhost:8080";
  Future<Response> getE(String path) async {
    print(path.split("&"));
    return get("$url/$path");
  }

  Future<Response> postE(String path, var e) async {
    print("url$path");
    return post("$url/$path", e);
  }

  Future<Response> putE(String path, var e) async {
    print("url$path");
    return put("$url/$path", e);
  }

  Future<Response> deleteE(String path) async {
    print("url$path");
    return delete("$url/$path");
  }
}

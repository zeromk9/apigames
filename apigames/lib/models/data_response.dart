import 'dart:convert';
import 'package:apigames/models/models.dart';
import 'package:apigames/models/models.dart';

class Response {
  List<GamesList> info;

  Response({
    required this.info,
  });

  factory Response.fromRawJson(String str) =>
      Response.fromJson(json.decode(str));

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        info: List<GamesList>.from(
            json["data"].map((x) => GamesList.fromJson(x))),
      );
}

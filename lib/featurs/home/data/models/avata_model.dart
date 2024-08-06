// To parse this JSON data, do
//
// final avatar = avatarFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

Avatar avatarFromJson(String str) => Avatar.fromJson(json.decode(str));

String avatarToJson(Avatar data) => json.encode(data.toJson());

class Avatar {
  final int version;
  final List<Datum> data;
  final int code;
  final String message;

  const Avatar({
    required this.version,
    required this.data,
    required this.code,
    this.message = "", // Optional message
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
    version: json["version"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "code": code,
    "message": message,
  };
}

class Datum {
  final int id;
  final String link;

  const Datum({
    required this.id,
    required this.link,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "link": link,
  };


  static Future<File> downloadImage(String imageUrl) async {
    try {
      final directory = await getTemporaryDirectory();
      final fileName = imageUrl.split('/').last;
      final savePath = '${directory.path}/$fileName';

      final dio = Dio();
      final response = await dio.download(imageUrl, savePath);

      if (response.statusCode == 200) {
        return File(savePath);
      } else {
        throw Exception('Failed to download image');
      }
    } catch (e) {
      throw Exception('Failed to download image: $e');
    }
  }
}

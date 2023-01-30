// To parse this JSON data, do
//
//     final TodoItemModel = TodoItemModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class TodoItemModel {
  TodoItemModel({
    this.id,
    this.content,
    this.createdAt,
    this.done,
    this.isFavorite,
    required this.audioFiles,
  });

  String? id;
  String? content;
  String? createdAt;
  bool? done = false;
  bool? isFavorite;
  List<String> audioFiles;

  factory TodoItemModel.fromRawJson(String str) =>
      TodoItemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TodoItemModel.fromJson(Map<String, dynamic> json) => TodoItemModel(
        id: json["id"],
        content: json["content"],
        createdAt: json["created_at"],
        done: json["done"],
        isFavorite: json["is_favorite"],
        audioFiles: List<String>.from(json["audio_files"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "created_at": createdAt,
        "done": done,
        "is_favorite": isFavorite,
        "audio_files": List<dynamic>.from(audioFiles.map((x) => x)),
      };
}

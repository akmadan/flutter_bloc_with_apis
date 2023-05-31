import 'dart:convert';

class PostDataUiModel {
  final int userId;
  final int id;
  final String title;
  final String body;
  PostDataUiModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostDataUiModel.fromMap(Map<String, dynamic> map) {
    return PostDataUiModel(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostDataUiModel.fromJson(String source) => PostDataUiModel.fromMap(json.decode(source));
}

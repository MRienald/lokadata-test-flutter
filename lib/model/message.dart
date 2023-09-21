// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
    final int? messageId;
    final User? user;
    final String? title;
    final String? message;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Message({
        this.messageId,
        this.user,
        this.title,
        this.message,
        this.createdAt,
        this.updatedAt,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        messageId: json["message_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        title: json["title"],
        message: json["message"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "message_id": messageId,
        "user": user?.toJson(),
        "title": title,
        "message": message,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class User {
    final int? userId;
    final String? name;
    final String? email;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    User({
        this.userId,
        this.name,
        this.email,
        this.createdAt,
        this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

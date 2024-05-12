import 'package:flutter/foundation.dart';

class ApiKeyEntity {
  final String id;
  final String name;
  final String api_key;
  final String secret_api_key;
  final DateTime createdAt;
  final DateTime updatedAt;

  ApiKeyEntity({
    required this.id,
    required this.name,
    required this.api_key,
    required this.secret_api_key,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ApiKeyEntity.fromJson(Map<String, dynamic> json) {
    return ApiKeyEntity(
      id: json['id'],
      name: json['name'],
      api_key: json['api_key'],
      secret_api_key: json['secret_api_key'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'api_key': describeEnum(api_key),
        'secret_api_key': describeEnum(secret_api_key),
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}

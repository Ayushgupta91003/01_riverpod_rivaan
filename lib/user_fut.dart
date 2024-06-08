// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final String email;
  User({
    required this.name,
    required this.email,
  });

  User copyWith({
    String? name,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  // Updated to accept Map<String, dynamic> directly
  factory User.fromJson(Map<String, dynamic> json) => User.fromMap(json);


  factory User.fromJso(String source) =>
    User.fromMap(json.decode(source) as Map<String, dynamic>);


  @override
  String toString() => 'User(name: $name, email: $email)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

// final userRepositoryProvider = Provider((ref) => UserRepository());
final userRepositoryProvider = Provider((ref) => UserRepository());

class UserRepository {
  Future<User> fetchUserData() async {
    final dio = Dio();
    try {
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/users/1");
      if (response.statusCode == 200) {
        // Ensure that the data is treated as a Map<String, dynamic>
        return User.fromJson(response.data);
      } else {
        throw Exception("Failed to fetch user: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      throw Exception("Failed to fetch user due to an exception");
    }
  }
}

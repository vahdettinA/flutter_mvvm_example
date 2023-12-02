import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_example/model/user_model.dart';

@immutable
final class UserService {
  UserService._();
  final Dio _dio = Dio();
  final String _pathUrl = "https://reqres.in/api/users?page=2";

  Future<UserModel?> fecthUser() async {
    var response = await _dio.get(_pathUrl);
    if (response.statusCode == HttpStatus.ok) {
      var body = UserModel.fromJson(response.data);
      return body;
    }
    return null;
  }
}

UserService _service = UserService._();
UserService get service => _service;

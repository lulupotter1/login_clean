import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureDB {
  static final AppSecureDB _instance = AppSecureDB._internal();

  factory AppSecureDB() => _instance;

  AppSecureDB._internal();

  static FlutterSecureStorage instance() {
    try {
      return const FlutterSecureStorage();
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static Env? _instance;
  Env._();

  static Env get i {
    _instance ??= Env._();
    return _instance!;
  }

  Future<void> load() => dotenv.load(fileName: '.env');
  String? operator [](String key) => dotenv.env[key];
}

extension EnvExtensions on BuildContext {
  Env get env => Env.i;
}

import 'package:flutter/services.dart';

late String homeJson;
late String pixLimitJson;

class JsonReader {
  Future<void> init() async {
    homeJson = await readHomeJson();
    pixLimitJson = await readPixLimitsJson();
  }

  Future<String> readHomeJson() async {
    return await rootBundle.loadString('assets/json_pages/home.json');
  }

  Future<String> readPixLimitsJson() async {
    return await rootBundle.loadString('assets/json_pages/pix_limit.json');
  }
}

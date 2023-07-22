import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String host = dotenv.get("API_HOST");
  static String key = dotenv.get("API_KEY");
  static String token = 'Bearer ${dotenv.get("API_TOKEN")}';
}

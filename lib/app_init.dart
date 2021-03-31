import 'package:newsapi/dependancy_injection/dependancy_injection.dart';

class AppInit {
  static Future<void> initialize() async {
    await initDependencyInjection();
  }
}

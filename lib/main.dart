import 'package:clean_architecture/features/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  runApp(const AppStud());
}

class AppStud extends StatelessWidget {
  const AppStud({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppStud',
      debugShowCheckedModeBanner: false,
      initialRoute: App.home,
      routes: Routes().routes,
    );
  }
}

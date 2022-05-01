import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:travel_app/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final sp = await StreamingSharedPreferences.instance;

  runApp(MyApp(sp));
}

class MyApp extends StatelessWidget {
  final StreamingSharedPreferences sp;
  const MyApp(this.sp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      initialRoute: '/',
      routes: generateRoutes(sp),
    );
  }
}


import 'package:crud_firebase/models/current.dart';
import 'package:crud_firebase/models/location.dart';
import 'package:crud_firebase/models/weather.dart';
import 'package:crud_firebase/ui/screens/section_one/home_screen.dart';
import 'package:crud_firebase/ui/screens/section_two/completed_task_screen.dart';
import 'package:crud_firebase/ui/screens/section_two/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive
    ..init(directory.path)
    ..registerAdapter(WeatherAdapter())..registerAdapter(LocationAdapter())..registerAdapter(CurrentAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomeScreen(),
        '/task': (ctx) => TaskScreen(),
        '/completed_task': (ctx) => CompletedTaskScreen(),
      },
    );
  }
}

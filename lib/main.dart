import 'package:crud_firebase/ui/screens/completed_task_screen.dart';
import 'package:crud_firebase/ui/screens/task_screen.dart';
import 'package:flutter/material.dart';
import 'locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
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
      home: TaskScreen(),
      routes: {
        '/home': (ctx) => TaskScreen(),
        '/completed_task': (ctx) => CompletedTaskScreen(),
      },
    );
  }
}

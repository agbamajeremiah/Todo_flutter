import 'package:crud_firebase/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, snapshot) {
          return Scaffold(
            appBar: PreferredSize(preferredSize: Size.fromHeight(60),
            child: AppBar(
              brightness: Brightness.dark,
              title: Text("API Test App"),)
            ,),
          );
        });
  }
}

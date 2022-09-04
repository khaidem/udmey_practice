import 'package:flutter/material.dart';
import 'package:practice_app/Mina_Farid_App/app/app.dart';

class TextApp extends StatelessWidget {
  const TextApp({Key? key}) : super(key: key);

  void updateAppState() {
    MyApp.instance.appState = 0;
  }

  void getAppState() {
    print(MyApp.instance.appState);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

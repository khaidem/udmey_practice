import 'package:flutter/material.dart';
import 'package:practice_app/Mina_Farid_App/presentation/resources/routes_manager.dart';
import 'package:practice_app/Mina_Farid_App/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); //private name constructor
  int appState = 0;

  static final MyApp instance = MyApp._internal();

  //Single intance == singleton

  ///** singleton ==>  object-oriented programming which ensures that a class has only
  ///** one instance and also provides a global point of access to it. */ */
  factory MyApp() => instance; // factory for the class instance
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //** onGenerateRoute: RouteGenerator.getRoute(Setting) this is not use in this case direct getRoute */
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:practice_app/ShoppingApp/app/app.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const ShoppingApp());
// }
//** Checking for ModalRoute.of(context) */
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         ExtractArgumentsScreen.routeName: (context) =>
//             const ExtractArgumentsScreen(),
//       },
//       title: 'Navigation with Arguments',
//       home: const HomeScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'Meals_App/app/app.dart';

void main() {
  runApp(const MyApp());
}

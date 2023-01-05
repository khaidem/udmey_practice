import 'package:flutter/material.dart';
import 'package:practice_app/Weather_APP/app/my_weatther.dart';

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

// void main() {
//   //** Form Bloc LearningCourse */
//   runApp(const MyApp());
// }

void main() {
  runApp(const MyWeather());
}

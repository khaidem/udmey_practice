import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/Bloc_Learning/cubit/active_todo/active_todo_cubit.dart';
import 'package:practice_app/Bloc_Learning/cubit/filter_todo/fliter_todo_cubit.dart';
import 'package:practice_app/Bloc_Learning/cubit/todo_filter/todo_filter_cubit.dart';
import 'package:practice_app/Bloc_Learning/cubit/todo_list/todo_list_cubit.dart';
import 'package:practice_app/Bloc_Learning/cubit/todo_search/todo_search_filter_cubit.dart';
import 'package:practice_app/Bloc_Learning/page/todo.page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider(
          create: (context) => TodoSearchFilterCubit(),
        ),
        BlocProvider(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<ActiveTodoCubit>(
          create: (context) => ActiveTodoCubit(
            todoListCubit: BlocProvider.of<TodoListCubit>(
              context,
            ),
            initialActiveCount:
                context.read<TodoListCubit>().state.todos.length,
          ),
        ),
        BlocProvider<FliterTodoCubit>(
          create: (context) => FliterTodoCubit(
            todoListCubit: BlocProvider.of<TodoListCubit>(
              context,
            ),
            todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
            todoSearchFilterCubit:
                BlocProvider.of<TodoSearchFilterCubit>(context),
            initialTodo: context.read<TodoListCubit>().state.todos,
          ),
        )
      ],
      child: MaterialApp(
        title: 'TODO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const TodoPage(),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:practice_app/ShoppingApp/Logic/auth.provider.dart';
// import 'package:practice_app/ShoppingApp/example/extract_arguments_screen.dart';

// import 'package:practice_app/ShoppingApp/screen/auth_screen.dart';
// import 'package:practice_app/ShoppingApp/screen/edit_product.screen.dart';
// import 'package:practice_app/ShoppingApp/screen/user_product.screen.dart';
// import 'package:provider/provider.dart';

// import '../shopping.dart';

// class ShoppingApp extends StatelessWidget {
//   const ShoppingApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => AuthProvider()),
//         ChangeNotifierProvider(
//           create: (context) => ProductsProvider(),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => CartProvider(),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => OrderProvider(),
//         ),
//       ],
//       child: Consumer<AuthProvider>(
//         builder: (cxt, auth, _) => MaterialApp(
//           title: 'MyShop',
//           theme: ThemeData(
//             primaryColor: Colors.purple,
//             fontFamily: 'Poppins',
//             colorScheme:
//                 ColorScheme.fromSwatch().copyWith(secondary: Colors.deepOrange),
//           ),
//           debugShowCheckedModeBanner: false,

//           //checking for auth or not
//           // auth.isAuth ? const ProductScreen() : const AuthScreen(),
//           home: const ProductScreen(),
//           routes: {
//             ProductDetailsScreen.routeName: (context) =>
//                 const ProductDetailsScreen(),
//             CartScreen.routeName: (context) => const CartScreen(),
//             OrderScreen.routeName: (context) => const OrderScreen(),
//             UserProductScreen.routeName: (context) => const UserProductScreen(),
//             EditProductScreen.routeName: (context) => const EditProductScreen(),
//             ExtractArgumentsScreen.routeName: (context) =>
//                 const ExtractArgumentsScreen(),
//             AuthScreen.routeName: (context) => const AuthScreen(),
//           },
//         ),
//       ),
//     );
//   }
// }

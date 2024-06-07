import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodd_rivaan/04_change_notifier.dart';
import 'package:riverpodd_rivaan/homeScreen.dart';
import 'package:riverpodd_rivaan/user.dart';

// types
// 1. Provider -> read only and cannot update the value once given

// 1st type
// final nameProvider = Provider((ref) {
//   return "Ayush";
// });
// this provider ref will allow us to talk with other providers.

// 2nd type
// StateProvider
// final nameProvider = StateProvider<String?>((ref) => null);   // not necessary to mention String.
// String? means that it can be null
// final userProvider = StateNotifierProvider<UserNotifier, User>(
//   (ref) => UserNotifier(
//     User(name: "", age: 0),
//   ),
// );
// first(UserNotifier) is the class  which we are returning and second(User) is the state fo the class

// final userProvider = StateNotifierProvider<UserNotifier, User>(
//   (ref) => UserNotifier(
//     User(age: 0, name: " "),
//   ),
// );

final userProvider =
    StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier());

// final userNotifierChange =
//     ChangeNotifierProvider((ref) => UserNotifierChange());

final userNotifierChangeProvider =
    ChangeNotifierProvider((ref) => UserNotifierChange());

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
      // home: HomeScreen4(),
    );
  }
}

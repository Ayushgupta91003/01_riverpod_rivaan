import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodd_rivaan/04_change_notifier.dart';
import 'package:riverpodd_rivaan/05_homeScr_future_pro.dart';
import 'package:riverpodd_rivaan/homeScreen.dart';
// import 'package:riverpodd_rivaan/user.dart';
import 'package:riverpodd_rivaan/user_fut.dart';

// final dio = Dio();

// final fetchUserProvider = FutureProvider<User>((ref) async {
//   // UserRepository user = new UserRepository();
//   return UserRepository().fetchUserData();
// });

final fetchUserProvider = FutureProvider<User>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData();
});

// final fetchUserProvider2 = FutureProvider<User>((ref) async {
//   // Initialize Dio
//   var dio = Dio();

//   try {
//     // Fetch data
//     final response =
//         await dio.get("https://jsonplaceholder.typicode.com/users/1");
//     print(response);
//     // Convert the response to a User object
//     if (response.statusCode == 200) {
//       print(response.data);
//       return User.fromJson(response.data);
//     } else {
//       throw Exception('Failed to fetch user: ${response.statusCode}');
//     }
//   } catch (e) {
//     // Handle error
//     print(e);
//     throw Exception('Failed to load user');
//   }
// });

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
      // home: HomeScreen(),
      // home: HomeScreen4(),
      home: HomeScreen5(),
    );
  }
}

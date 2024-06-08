// git pe sab stored hai.
//

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodd_rivaan/04_change_notifier.dart';
import 'package:riverpodd_rivaan/05_homeScr_future_pro.dart';
import 'package:riverpodd_rivaan/homeScreen.dart';
// import 'package:riverpodd_rivaan/user.dart';
import 'package:riverpodd_rivaan/user_fut.dart';

final streamProvider = StreamProvider((ref) async* {
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});

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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodd_rivaan/main.dart';
import 'package:riverpodd_rivaan/user.dart';

class HomeScreen4 extends ConsumerWidget {
  const HomeScreen4({super.key});
  // void onSubmit(WidgetRef ref, String value) {
  //   ref.read(userProvider.notifier).updateName(value);
  // }
  void onSubmit(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

  void changeAge(WidgetRef ref, String n) {
    ref.read(userProvider.notifier).updateAge(int.parse(n));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(userProvider);
    // final user = ref.watch(userProvider.select((value) => value.name));
    final user = ref.watch(userProvider.select((value) => value.age));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(user.toString()),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              onSubmit(ref, value);
            },
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            onSubmitted: (value) {
              changeAge(ref, value);
            },
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(user.toString()),
          )
        ],
      ),
    );
  }
}

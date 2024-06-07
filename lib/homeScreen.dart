import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodd_rivaan/main.dart';
import 'package:riverpodd_rivaan/user.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  // void onSubmit(WidgetRef ref, String value) {
  //   ref.read(userProvider.notifier).updateName(value);
  // }
  // void onSubmit(WidgetRef ref, String value) {
  //   ref.read(userProvider.notifier).updateName(value);
  // }

  // void changeAge(WidgetRef ref, String n) {
  //   ref.read(userProvider.notifier).updateAge(int.parse(n));
  // }
  void onSubmit(WidgetRef ref, String n) {
    ref.read(userNotifierChangeProvider).updateName(n);
  }

  void changeAge(WidgetRef ref, int n) {
    ref.read(userNotifierChangeProvider).updateAge(n);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(userProvider);
    // final user = ref.watch(userProvider.select((value) => value.name));
    // final user = ref.watch(userProvider.select((value) => value.age));
    final user = ref.watch(userNotifierChangeProvider).user;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(user.name),
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
              changeAge(ref, int.parse(value));
            },
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(user.age.toString()),
          )
        ],
      ),
    );
  }
}

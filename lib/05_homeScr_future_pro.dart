import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodd_rivaan/main.dart';
import 'package:riverpodd_rivaan/user.dart';

class HomeScreen5 extends ConsumerWidget {
  const HomeScreen5({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(fetchUserProvider);

    // return user.when(data: (data) {
    //   return Scaffold(
    //     backgroundColor: Colors.white,
    //     appBar: AppBar(),
    //     body: Expanded(
    //       child: Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(data.name),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }, error: (error, stackTrace) {
    //   return Center(
    //     child: Text(error.toString()),
    //   );
    // }, loading: () {
    //   return Center(
    //     child: CircularProgressIndicator(),
    //   );
    // });

    return Scaffold(
        body: ref.watch(streamProvider).when(
      data: (data) {
        return Text(data.toString());
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(error.toString()),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
          
        );
      },
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'controller/counter_provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              builder: (_, ref, buttonWidget) {
                final counter = ref.select(
                  counterProvider.select(
                    (_) => _.counter,
                  ),
                );
                return Column(
                  children: [
                    Text(
                      "$counter",
                      style: const TextStyle(fontSize: 35),
                    ),
                    buttonWidget!
                  ],
                );
              },
              child: FloatingActionButton(
                onPressed: counterProvider.read.increment,
              ),
            ),
            // Consumer(
            //   builder: (_, ref, __) {
            //     final name = ref.select(
            //       counterProvider.select(
            //         (_) => _.name,
            //       ),
            //     );

            //     return Text(
            //       name,
            //       style: const TextStyle(fontSize: 15),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

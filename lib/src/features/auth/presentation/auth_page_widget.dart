//
//
//
//  =====================================================================================
//  =====================================================================================
//
// Exemplo (widget)
//
import 'package:flutter/material.dart';
import 'package:income_expenses_flow/src/features/auth/presentation/auth_state.dart';

class SomePage {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: counterState.count, // listener
            builder: (context, int count, _) =>
                CounterWidget(counter: count) // rebuild
            ),
      ),
      //	...
    );
  }
}

//
class CounterWidget extends StatelessWidget {
  final int counter;

  const CounterWidget({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          counter.toString(),
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class _Counter extends ChangeNotifier {
  final ValueNotifier<int> count = ValueNotifier(0);

  incremet() {
    count.value++; // change value and notify listeners
  }
}

// Singleton approach
final counterState = _Counter();

// Melhoria: usar gerencimanento de depedencia/provider, recuperar o estado diretamente
// de dentro do CounterWidget sem precisar receber por parametro.
//

//
//
//
//  =====================================================================================
//  =====================================================================================
//
// Exemplo (widget)
//
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

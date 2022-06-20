import 'package:flutter/material.dart';

class _Counter extends ChangeNotifier {
  final ValueNotifier<int> count = ValueNotifier(0);

  incremet() {
    count.value++; // change value and notify listeners
  }
}

// Singleton approach
final counterState = _Counter();

// Melhoria: usar gerencimanento de depedencia (GetX...), 
// recuperar o estado diretamente de dentro do CounterWidget 
// sem precisar receber por parametro.
//

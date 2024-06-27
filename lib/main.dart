import 'package:flutter/material.dart';
import 'package:meu_primeiro_projeto/screens/form_screen.dart';
import 'package:meu_primeiro_projeto/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de tarefas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      home: const FormScreen(),
    );
  }
}

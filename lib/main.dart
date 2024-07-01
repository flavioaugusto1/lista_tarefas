import 'package:flutter/material.dart';
import 'package:meu_primeiro_projeto/data/task_inherited.dart';
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          appBarTheme: const AppBarTheme(color: Colors.cyan),
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData(backgroundColor: Colors.cyan),
          elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Colors.cyan,
              ),
            ),
          ),
          useMaterial3: false,
        ),
        home: TaskInherited(child: const Home()));
  }
}

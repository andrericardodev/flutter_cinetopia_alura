import 'package:flutter/material.dart';

import '../ui/screens/home_page.dart';

class CinetopiaApp extends StatelessWidget {
  const CinetopiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinetopia',
      theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          colorSchemeSeed: Colors.purple),
      home: const HomePage(),
    );
  }
}

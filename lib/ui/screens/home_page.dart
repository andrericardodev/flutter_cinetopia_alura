import 'package:flutter/material.dart';
import 'package:flutter_cinetopia_alura/ui/components/buttons.dart';
import 'package:flutter_cinetopia_alura/ui/screens/dashboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Color(0xFF000000),
          Color(0xFF1D0E44),
        ], begin: Alignment.topCenter)),
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Center(
            child: Column(
              spacing: 24,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/logo.png"),
                Image.asset("assets/images/splash.png"),
                Text(
                  "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PrimaryButton(
                  label: "Quero começar",
                  icon: Icons.arrow_forward_rounded,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_cinetopia_alura/ui/screens/releases.dart';
import 'package:flutter_cinetopia_alura/ui/screens/search_movies.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    SearchMovies(),
    Releases(),
  ];

  void updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF120326),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 54, 16, 0),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap:(value) => updateIndex(value),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Filmes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Lançamentos',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:comicvine/src/presentation/widgets/CustomAppBar.dart';
import 'package:comicvine/src/presentation/sections/HomeSection.dart';
import 'package:comicvine/src/presentation/sections/ComicsSection.dart';

class MainScreen extends StatefulWidget {
  final GoRouter goRouter;
  const MainScreen({Key? key, required this.goRouter}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTabPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Bienvenue !"),
      body: _getContent(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabPosition,
        type: BottomNavigationBarType.fixed,
        items: AppTabs.values
            .map((tab) =>
            BottomNavigationBarItem(label: tab.label, icon: Icon(tab.icon)))
            .toList(growable: false),
        onTap: (int position) {
          setState(() {
            _currentTabPosition = position;
          });
        },
      ),
    );
  }

  Widget _getContent() {
    // TODO Remplacer par les écrans
    switch (AppTabs.values[_currentTabPosition]) {
      case AppTabs.home:
        return HomeSection();
      case AppTabs.comics:
        return ComicsSection();
      case AppTabs.series:
        return const Center(child: Text('Séries'));
      case AppTabs.movies:
        return const Center(child: Text('Films'));
      case AppTabs.search:
        return const Center(child: Text('Recherche'));
    }
  }
}

enum AppTabs {
  home(
    'Accueil',
    Icons.home,
  ),
  comics(
    'Comics',
    Icons.book,
  ),
  series(
    'Séries',
    Icons.live_tv,
  ),
  movies(
    'Films',
    Icons.movie,
  ),
  search(
    'Recherche',
    Icons.search,
  );

  final String label;
  final IconData icon;

  const AppTabs(this.label, this.icon);
}
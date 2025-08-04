import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/view/about_page.dart';
import 'package:guitar_learner/view/home_page.dart';
import 'package:guitar_learner/view/widgets/tab_navigator_widget.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final double _iconScaleFactor = 1.2;
  int _selectedIndex = 0;

  // Lista de chaves, uma para cada navegador de aba
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  final List<Widget> _rootPages = [
    const HomePage(),
    const AboutPage(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      // Limpa a pilha de navegação da aba atual ao tocar nela novamente
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        // Se um pop já aconteceu no Navigator da aba, não fazemos nada.
        if (didPop) {
          return;
        }

        // Se não estamos na primeira aba (index 0), volte para ela.
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: List.generate(_rootPages.length, (index) {
            return TabNavigatorWidget(
              navigatorKey: _navigatorKeys[index],
              rootPage: _rootPages[index],
            );
          }),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Transform.scale(
                  scale: _iconScaleFactor,
                  child: const Icon(Icons.music_note_outlined)),
              activeIcon: Transform.scale(
                  scale: _iconScaleFactor, child: const Icon(Icons.music_note)),
              label: AppLocalizations.of(context)!.appTitle,
            ),
            BottomNavigationBarItem(
              icon: Transform.scale(
                  scale: _iconScaleFactor,
                  child: const Icon(Icons.settings_outlined)),
              activeIcon: Transform.scale(
                  scale: _iconScaleFactor, child: const Icon(Icons.settings)),
              label: AppLocalizations.of(context)!.about,
            ),
          ],
        ),
      ),
    );
  }
}

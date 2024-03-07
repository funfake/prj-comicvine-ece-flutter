import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Comics',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Films',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.movie),
        //   label: 'Films',
        // ),
      ],
    );
  }
}
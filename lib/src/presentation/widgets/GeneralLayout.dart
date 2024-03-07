import 'package:comicvine/src/presentation/widgets/CustomNavBar.dart';
import 'package:flutter/material.dart';

class GeneralLayout extends StatefulWidget {
  final Widget content;

  GeneralLayout({required this.content});

  @override
  _GeneralLayoutState createState() => _GeneralLayoutState();
}

class _GeneralLayoutState extends State<GeneralLayout> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.content,
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Menu cascada con submenus'),
        ),
        body: const Center(
          child: MainMenu(),
        ),
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  void handleMenuSelection(BuildContext context, String value) {
    if (value == 'Submenu1') {
      _showSubMenu1(context);
    } else if (value == 'Submenu2') {
      _showSubMenu2(context);
    }
  }

  static void _showSubMenu1(BuildContext context) {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(200, 200, 200, 200),
      items: [
        const PopupMenuItem<String>(
            value: 'Sub1Opt1', child: Text('Submenu 1 - Opcion 1')),
        const PopupMenuItem<String>(
            value: 'Sub1Opt2', child: Text('Submenu 1 - Opcion 2')),
      ],
    ).then((value) {
      if (value != null) {
        // print('Seleccionaste $value');
      }
    });
  }

  static void _showSubMenu2(BuildContext context) {
    showMenu(
        context: context,
        position: const RelativeRect.fromLTRB(200, 200, 200, 200),
        items: [
          const PopupMenuItem<String>(
              value: 'Sub2Opt1', child: Text('Submenu 2 - Opcion 1')),
          const PopupMenuItem<String>(
              value: 'Sub2Opt2', child: Text('Submenu 2 - Opcion 2')),
        ]).then((value) {
      if (value != null) {
        //print('Seleccionaste $value');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) => handleMenuSelection(context, value),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
            value: 'Submenu1', child: Text('Submenu 1')),
        const PopupMenuItem<String>(
            value: 'Submenu2', child: Text('Submenu 2')),
      ],
    );
  }
}

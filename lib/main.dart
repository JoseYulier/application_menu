import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

void main() => runApp(const MenuAcceleratorApp());

class MyMenuBar extends StatelessWidget {
  const MyMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: MenuBar(
                children: <Widget>[
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        leadingIcon: const Icon(Icons.save),
                        trailingIcon: const Text('Ctrl + S',
                            style: TextStyle(color: Colors.grey)),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Save!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Save'),
                      ),
                      MenuItemButton(
                        leadingIcon: const Icon(Icons.save),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Save as!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Save as'),
                      ),
                      MenuItemButton(
                        leadingIcon: const Icon(Icons.insert_drive_file),
                        trailingIcon: const Text('Ctrl + O',
                            style: TextStyle(color: Colors.grey)),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Open file!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Open file'),
                      ),
                      MenuItemButton(
                        leadingIcon: const Icon(Icons.folder),
                        trailingIcon: const Text('Ctrl + F',
                            style: TextStyle(color: Colors.grey)),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Open folder!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Open folder'),
                      ),
                      SubmenuButton(
                        menuChildren: <Widget>[
                          MenuItemButton(
                            leadingIcon: const Icon(Icons.shortcut),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Shortcuts!'),
                                ),
                              );
                            },
                            child: const MenuAcceleratorLabel('&Shortcuts'),
                          ),
                          MenuItemButton(
                            leadingIcon: const Icon(Icons.extension),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Extensions!'),
                                ),
                              );
                            },
                            child: const MenuAcceleratorLabel('&Extensions'),
                          ),
                          SubmenuButton(
                            leadingIcon: const Icon(Icons.format_paint),
                            menuChildren: <Widget>[
                              MenuItemButton(
                                leadingIcon: const Icon(Icons.wb_sunny),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Light theme!'),
                                    ),
                                  );
                                },
                                child:
                                    const MenuAcceleratorLabel('&Light theme'),
                              ),
                              MenuItemButton(
                                leadingIcon: const Icon(Icons.wb_cloudy),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Dark theme!'),
                                    ),
                                  );
                                },
                                child:
                                    const MenuAcceleratorLabel('&Dark theme'),
                              ),
                            ],
                            child: const MenuAcceleratorLabel('&Change theme'),
                          ),
                        ],
                        leadingIcon: const Icon(Icons.settings),
                        child: const MenuAcceleratorLabel('&Preference'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          exit(0);
                        },
                        leadingIcon: const Icon(Icons.exit_to_app_rounded),
                        child: const MenuAcceleratorLabel('&Quit'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&File'),
                  ),
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Magnify!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Magnify'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Minify!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('Mi&nify'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&Edit'),
                  ),
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        onPressed: () {
                          showAboutDialog(
                            context: context,
                            applicationName: 'MenuBar Sample',
                            applicationVersion: '1.0.0',
                          );
                        },
                        child: const MenuAcceleratorLabel('&About Version'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Other!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Other'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&Help'),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: FlutterLogo(
            size: MediaQuery.of(context).size.shortestSide * 0.5,
          ),
        ),
      ],
    );
  }
}

class MenuAcceleratorApp extends StatelessWidget {
  const MenuAcceleratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My MenuApp',
      theme: ThemeData(useMaterial3: true),
      home: Shortcuts(
        shortcuts: <ShortcutActivator, Intent>{
          const SingleActivator(LogicalKeyboardKey.keyT, control: true):
              VoidCallbackIntent(() {
            debugDumpApp();
          }),
        },
        child: const Scaffold(body: SafeArea(child: MyMenuBar())),
      ),
    );
  }
}

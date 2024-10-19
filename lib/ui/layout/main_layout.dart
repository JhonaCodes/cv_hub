import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const _CustomDrawer(),
        appBar: AppBar(
          title: const Text("CV HUB"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: child,
        )
    );
  }
}


class _CustomDrawer extends StatelessWidget {
  const _CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer();
  }
}
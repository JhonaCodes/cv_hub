import 'package:flutter/material.dart';

class SectionWithOnlyTitle extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const SectionWithOnlyTitle({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              )
          ),
        ),

        ...children

      ],
    );
  }
}

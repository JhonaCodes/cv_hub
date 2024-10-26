import 'package:flutter/material.dart';

import 'custom_elevated_button.dart';

class CvFormatActions extends StatelessWidget {
  const CvFormatActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          runSpacing: 10,
          spacing: 10,
          direction: Axis.horizontal,
          children: [
            CustomElevatedButton(
              label: "Descargar CV",
              icon: const Icon(Icons.download, size: 20),
              onTap: () {},
            ),
            CustomElevatedButton(
              label: "Descargar CV",
              icon: const Icon(Icons.download, size: 20),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

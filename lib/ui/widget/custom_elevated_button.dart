
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final Color? colorButton;
  final TextStyle? textStyle;
  final void Function() onTap;
  const CustomElevatedButton({super.key, required this.icon, required this.label, this.colorButton, required this.onTap, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(label, style: textStyle ?? const TextStyle(color: Colors.white, fontSize: 10),),

      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>( colorButton ?? const Color(0xFFF131315)),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          )),
        visualDensity: VisualDensity.compact,
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.only(left: 5,right: 7,))
      ),
      onPressed: onTap,
      icon: icon,
    );
  }
}

import 'package:flutter/material.dart';

class CustomPill extends StatefulWidget {
  final String label;
  final void Function()? onTap;
  const CustomPill({super.key, required this.label, this.onTap});

  @override
  State<CustomPill> createState() => _CustomPillState();
}

class _CustomPillState extends State<CustomPill> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap?.call();
        ///todo: Go to URL.
      },
      onHover: (isHover) => setState(() => _isHovered = isHover),

      overlayColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: _isHovered ? const Color(0xffDDEEFD) : const Color(0xffBDDCF6),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0,bottom: 2.0, left: 5.0, right: 5.0),
          child: Text(widget.label, style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: const Color(0xff3471C0)
          ),),
        ),
      ),
    );
  }
}

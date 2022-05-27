import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onpress});
  final IconData icon;
  final void Function() onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      elevation: 6,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
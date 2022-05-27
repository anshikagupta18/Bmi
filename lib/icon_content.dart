import 'package:flutter/material.dart';
import 'constants.dart';
class iconContent extends StatelessWidget {
  iconContent({required this.lable, required this.icon});
  final String lable;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kIconSize,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          lable,
          style: kLableTextStyle
        ),
      ],
    );
  }
}

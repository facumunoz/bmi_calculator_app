import 'package:flutter/material.dart';
import 'Constants.dart';

class CardContent extends StatelessWidget {
  CardContent({@required this.icon, @required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: Colors.white, size: 50.0),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kTextStyle,
        )
      ],
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class StandardButton extends StatelessWidget {
  final String text;
  StandardButton({@required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => {},
      color: Colors.transparent,
      padding: EdgeInsets.all(2.0),
      splashColor: Colors.amberAccent,
      textColor: Colors.white,
      height: 23,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Colors.white)),
      child: Text(
        this.text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

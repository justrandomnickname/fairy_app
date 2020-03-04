import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fairy_app/Modules/UI/index.dart';

class Modal extends StatelessWidget {
  final Widget child;
  final String title;
  Modal({@required this.child, @required this.title});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1.0,
      widthFactor: 1.0,
      child: Container(
        color: Colors.black54,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 7.5,
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
            child: Container(
              width: 300,
              height: 300,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Text(this.title, style: AppBigTitle),
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    child: this.child,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

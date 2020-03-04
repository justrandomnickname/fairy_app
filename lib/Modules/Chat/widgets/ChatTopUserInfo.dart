import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ChatTopUserInfo extends StatefulWidget {
  @override
  _ChatTopUserInfoState createState() => _ChatTopUserInfoState();
}

class _ChatTopUserInfoState extends State<ChatTopUserInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 2,
      height: 700,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(2000)),
    );
  }
}

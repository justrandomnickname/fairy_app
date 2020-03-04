import 'package:flutter/widgets.dart';
import './User.dart';

class Message {
  final User user;
  final String text;
  final bool isMine;
  Message({@required this.text, @required this.user, @required this.isMine});
}

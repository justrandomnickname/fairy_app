import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fairy_app/Modules/Models/Message.dart';
import 'package:fairy_app/Modules/UI/index.dart';

class ChatConstants {
  static const BorderRadius BorderRadiusIfIsMine = BorderRadius.only(
      topLeft: Radius.zero,
      bottomLeft: Radius.zero,
      topRight: Radius.circular(10),
      bottomRight: Radius.circular(10));
  static const BorderRadius BorderRadiusIfIsNotMine = BorderRadius.only(
    topLeft: Radius.circular(10),
    bottomLeft: Radius.circular(10),
    topRight: Radius.zero,
    bottomRight: Radius.zero,
  );

  // Creates rounded borded with via padding position of certain element.
  // This is actually a border
  static const double BorderWidth = 1.0;
  static const EdgeInsets BorderIfIsMine = EdgeInsets.only(
      right: BorderWidth, bottom: BorderWidth, top: BorderWidth);
  static const EdgeInsets BorderIfIsNotMine =
      EdgeInsets.only(left: BorderWidth, bottom: BorderWidth, top: BorderWidth);

  static const Color MessageColorIfIsMine = Color.fromRGBO(173, 216, 230, 0.5);
  // static const Color MessageColorIfIsNotMine =
  //     Color.fromRGBO(173, 216, 230, 0.25);
  static const Color MessageColorIfIsNotMine =
      Color.fromRGBO(253, 221, 230, 0.5);
}

class ChatList extends StatefulWidget {
  final List<Message> messages;
  ChatList({@required this.messages});
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 50.0),
      child: Column(
        children: <Widget>[for (final _item in widget.messages) message(_item)],
      ),
    );
  }

  // TODO message is mine

  // TODO message is not mine

  // TODO message with picture is mine

  // TODO message with picture not mine

  Widget message(Message message) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      alignment: message.isMine ? Alignment.bottomLeft : Alignment.bottomRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 100,
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        child: Container(
          padding: EdgeInsets.only(
              top: 20.0,
              bottom: 10.0,
              left: message.isMine ? 20.0 : 10.0,
              right: message.isMine ? 10.0 : 20.0),
          decoration: BoxDecoration(
            borderRadius: message.isMine
                ? ChatConstants.BorderRadiusIfIsMine
                : ChatConstants.BorderRadiusIfIsNotMine,
            color: message.isMine
                ? ChatConstants.MessageColorIfIsMine
                : ChatConstants.MessageColorIfIsNotMine,
          ),
          child: Text(
            message.text,
            style: standardText,
          ),
        ),
      ),
    );
  }

  BorderRadius calculateBorderRadius(Message message) {
    return message.isMine
        ? ChatConstants.BorderRadiusIfIsMine
        : ChatConstants.BorderRadiusIfIsNotMine;
  }
}

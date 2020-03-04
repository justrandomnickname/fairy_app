import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fairy_app/Modules/Models/Message.dart';
import 'package:fairy_app/Modules/Models/User.dart';
import 'package:fairy_app/Modules/Chat/widgets/ChatList.dart';
import 'package:fairy_app/Modules/Chat/widgets/MessageInput.dart';
import './ChatTopUserInfo.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Message> _messages = [];
  ScrollController _scrollController = ScrollController();
  bool isInputActive = false;

  @override
  void initState() {
    super.initState();
    this.setState(() {
      this._messages.add(new Message(
          text: 'Hey there!',
          isMine: true,
          user: new User(gender: Genders.Male, name: 'Karwen')));
      this._messages.add(new Message(
          text: 'Hey there!',
          isMine: true,
          user: new User(gender: Genders.Male, name: 'Karwen')));
      this._messages.add(new Message(
          text: 'Hey there!',
          isMine: true,
          user: new User(gender: Genders.Male, name: 'Karwen')));
      this._messages.add(new Message(
          text: 'Hey there!',
          isMine: true,
          user: new User(gender: Genders.Male, name: 'Karwen')));
      this._messages.add(new Message(
          text: 'Hey there!',
          isMine: true,
          user: new User(gender: Genders.Male, name: 'Karwen')));
      this._messages.add(new Message(
          text: 'Hey there!',
          isMine: true,
          user: new User(gender: Genders.Male, name: 'Karwen')));
      this._messages.add(new Message(
          text: 'Hi, Karwen. Nice to meet  you!',
          isMine: false,
          user: new User(gender: Genders.Female, name: 'Priscilla')));
      this._messages.add(new Message(
          text: 'How are you?',
          isMine: false,
          user: new User(gender: Genders.Female, name: 'Priscilla')));
    });
  }

  @override
  void dispose() {
    super.dispose();
    this._scrollController.dispose();
  }

  void sendMessage(String text) {
    print('MESSAGE SENT $text');
    this.setState(() {
      this._messages.add(new Message(
          text: text,
          isMine: true,
          user: new User(gender: Genders.Male, name: 'Karwen')));
    });
  }

  void animateToEnd() {
    Timer(Duration(milliseconds: 100), () {
      print('animate to end medium');
      this._scrollController.animateTo(
          this._scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut);
    });
  }

  void setActiveInput(bool value) {
    this.setState(() {
      this.isInputActive = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          ChatTopUserInfo(),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              controller: this._scrollController,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width * 1,
                  minHeight: (MediaQuery.of(context).size.height * 1) - 150,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25),
                  alignment: Alignment.bottomCenter,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: ChatList(
                      messages: this._messages,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: MessageInput(
              sendMessage: this.sendMessage,
              animateToEnd: this.animateToEnd,
              setActiveInput: this.setActiveInput,
            ),
          )
        ],
      ),
    );
  }
}

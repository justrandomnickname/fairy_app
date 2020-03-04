import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fairy_app/Modules/Auth/services/auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fairy_app/Modules/Models/Message.dart';
import 'package:fairy_app/Modules/Models/User.dart';
import 'package:fairy_app/Modules/Chat/widgets/ChatList.dart';
import 'package:fairy_app/Modules/Chat/widgets/MessageInput.dart';
import 'package:fairy_app/Modules/Chat/services/chat.dart';
import 'package:fairy_app/Modules/Store/index.dart';
import './widgets/ChatTopUserInfo.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> with SingleTickerProviderStateMixin {
  // ChatService _chatService = ChatService();
  List<Message> _messages = [];
  ScrollController _scrollController = ScrollController();
  Animation<double> animation;
  AnimationController _animationController;
  bool isInputActive = false;

  // TODO DELETE THIS THEN DONE;
  // AuthService _authService = AuthService();
  // FirebaseUser _user;

  // void signIn() async {
  //   AuthResult result = await this._authService.signInAnonymously();
  //   this.setState(() {
  //     this._user = result.user;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // this.signIn();
    // print(this._scrollController.position.maxScrollExtent);
    this._animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    final Animation curve = CurvedAnimation(
        parent: this._animationController, curve: Curves.easeOut);
    this.animation = Tween<double>(begin: -100, end: 100).animate(curve)
      ..addListener(() {
        setState(() {});
      });
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
          text: 'How are you&&?',
          isMine: false,
          user: new User(gender: Genders.Female, name: 'Priscilla')));
    });
    this._animationController.forward();
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
      this._scrollController.animateTo(
          this._scrollController.position.minScrollExtent,
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
    return Container();
    // return Scaffold(
    //   resizeToAvoidBottomInset: true,
    //   backgroundColor: Colors.white,
    //   body: Text('Hi there!'
    // StoreConnector(
    // conditionalCallback: (GlobalStore store) {
    // if (this._user != null) {
    // print('THIS USER NOT NULL');
    // store.$auth.currentUser = this._user;
    // this._chatService.setAuthContext(store.$auth.currentUser);
    // return true;
    // }
    // if (store.$auth.currentUser != null) {
    //   print('STORE USER NOT NULL SET AUTH CONTEXT');
    //   // this._chatService.setAuthContext(store.$auth.currentUser);
    //   return true;
    // } else {
    //   return Container(
    //     child: Text('No element'),
    //   );
    // }
    // return true;
    // },
    // builder: (GlobalStore store) {
    //   return chat();
    // },
    // ),
    // );
  }

  Widget chat() {
    return Container(
      child: Stack(
        alignment: Alignment(1, 1),
        children: [
          ChatTopUserInfo(),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            // margin:
            // EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              reverse: true,
              controller: this._scrollController,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width * 1,
                  // minHeight: (MediaQuery.of(context).size.height * 1) - 150,
                ),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25),
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

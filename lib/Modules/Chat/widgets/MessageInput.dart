import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageInput extends StatefulWidget {
  final Function setActiveInput;
  final Function animateToEnd;
  final Function sendMessage;
  MessageInput(
      {@required this.setActiveInput,
      @required this.animateToEnd,
      @required this.sendMessage});

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _textEditingController = TextEditingController();
  final KeyboardVisibilityNotification _keyboardVisibilityNotification =
      KeyboardVisibilityNotification();
  String message;
  FocusNode _focus = new FocusNode();
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    this._focus.addListener(this.onFocusChange);
    this
        ._keyboardVisibilityNotification
        .addNewListener(onChange: this.onKeyboardVisibilityChange);
  }

  @override
  void dispose() {
    super.dispose();
    this._textEditingController.dispose();
    this._focus.dispose();
    this._keyboardVisibilityNotification.dispose();
  }

  void onKeyboardVisibilityChange(bool isVisible) {
    print('Keyboard visible?: $isVisible');

    if (isVisible) {
      print('animate to end start');
      this.isActive = true;
      widget.animateToEnd();
    } else if (!isVisible) {
      this.isActive = false;
      this._focus.unfocus();
    }
  }

  void onFocusChange() {
    print('Focused?: ${this._focus.hasFocus}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      height: this.isActive ? 90 : 60,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10.0)]),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 1 - 75,
            alignment:
                this.isActive ? Alignment.topCenter : Alignment.bottomRight,
            child: TextField(
              controller: this._textEditingController,
              focusNode: this._focus,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              autocorrect: true,
              enableSuggestions: true,
              maxLines: null,
              style: TextStyle(fontFamily: 'Roboto'),
              decoration: this.isActive
                  ? InputDecoration(hintText: '', border: InputBorder.none)
                  : InputDecoration(
                      hintText: 'Type message', border: InputBorder.none),
            ),
          ),
          GestureDetector(
              onTap: () {
                widget.sendMessage(this._textEditingController.text);
                this._focus.unfocus();
                this._textEditingController.clear();
                this.isActive = false;
              },
              child: Container(
                width: 35,
                height: 35,
                color: Colors.white,
                child: SvgPicture.asset(
                  'assets/images/send.svg',
                  // width: 25,
                  // height: 25,
                ),
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../UI/index.dart';

class ThreadSuggestionMenu extends StatefulWidget {
  final bool isActive;
  const ThreadSuggestionMenu({Key key, @required this.isActive})
      : super(key: key);
  @override
  _ThreadSuggestionMenuState createState() => _ThreadSuggestionMenuState();
}

class _ThreadSuggestionMenuState extends State<ThreadSuggestionMenu>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;
  bool isOpened = false;

  @override
  void initState() {
    super.initState();
    this._controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    _animation = Tween<Offset>(begin: Offset(0, 0.1), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isActive && !this.isOpened) {
      this._controller.forward();
      this.isOpened = true;
    } else if (!widget.isActive && this.isOpened) {
      this._controller.reverse();
      this.isOpened = false;
    }
    return Positioned(
      child: SlideTransition(
        position: _animation,
        child: new Align(
          alignment: FractionalOffset.bottomCenter,
          child: FractionallySizedBox(
            widthFactor: 1.0,
            heightFactor: .05,
            child: menu(),
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: Colors.black87,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              child: SvgPicture.asset(
                'assets/images/twitter.svg',
                width: 23,
                height: 23,
                color: Colors.white,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              child: SvgPicture.asset(
                'assets/images/twitter.svg',
                width: 23,
                height: 23,
                color: Colors.white,
              ),
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Container(
              child: StandardButton(
                text: widget.isActive ? 'true' : 'false',
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              child: SvgPicture.asset(
                'assets/images/user.svg',
                width: 23,
                height: 23,
                color: Colors.white,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              child: SvgPicture.asset(
                'assets/images/kakao-talk.svg',
                width: 23,
                height: 23,
                color: Colors.white,
              ),
            ),
          ),
          // Image.asset(
          //   'assets/images/kakao-talk.svg',
          //   // width: 30.0,
          //   // height: 30.0,
          // ),
        ],
      ),
    );
  }
}

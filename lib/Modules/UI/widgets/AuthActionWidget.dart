import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fairy_app/Modules/UI/index.dart';

enum AuthType {
  Facebook,
  Google,
  Vkontakte,
  Twitter,
  Email,
}

class AuthActionWidget extends StatefulWidget {
  final AuthType type;
  const AuthActionWidget({Key key, @required this.type}) : super(key: key);
  @override
  _AuthActionWidgetState createState() => _AuthActionWidgetState();
}

class _AuthActionWidgetState extends State<AuthActionWidget> {
  String pic;
  String text;

  @override
  void initState() {
    super.initState();
    this.setState(() {
      this.pic = this.getPic(widget.type);
      this.text = this.getText(widget.type);
    });
  }

  String getText(AuthType type) {
    switch (type) {
      case AuthType.Facebook:
        return 'Facebook account';
      case AuthType.Google:
        return 'Google account';
      case AuthType.Vkontakte:
        return 'Vkontakte account';
      case AuthType.Twitter:
        return 'Twitter account';
      default:
        return '';
    }
  }

  String getPic(AuthType type) {
    print('start getting pic');
    switch (type) {
      case AuthType.Facebook:
        return 'assets/images/social/facebook.svg';
      case AuthType.Google:
        return 'assets/images/social/google-plus.svg';
      case AuthType.Vkontakte:
        return 'assets/images/social/vk.svg';
      case AuthType.Twitter:
        return 'assets/images/social/twitter.svg';
      default:
        return 'assets/images/user.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 30.0, bottom: 15.0),
            child: SvgPicture.asset(
              this.pic ?? 'assets/images/user.svg',
              width: 45,
              height: 45,
              color: Colors.black,
            ),
          ),
          Text(
            this.text ?? 'ERROR',
            style: AppTitle,
          ),
        ],
      ),
    );
  }
}

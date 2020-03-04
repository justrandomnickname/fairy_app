import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fairy_app/Modules/UI/index.dart';

class OAuthDialog extends StatefulWidget {
  @override
  _OAuthDialogState createState() => _OAuthDialogState();
}

class _OAuthDialogState extends State<OAuthDialog> {
  @override
  Widget build(BuildContext context) {
    return Modal(
      title: 'Auth',
      child: Column(
        children: <Widget>[
          TextField(
              enableSuggestions: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email')),
          TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password')),
        ],
      ),
    );
  }
}

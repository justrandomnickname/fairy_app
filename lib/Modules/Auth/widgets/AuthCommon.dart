import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fairy_app/Modules/Auth/services/auth.dart';
import 'package:fairy_app/Modules/UI/index.dart';
import 'package:fairy_app/Modules/Store/index.dart';

class AuthCommon extends StatefulWidget {
  final AuthService _auth = new AuthService();
  final Function scrollTo;

  AuthCommon({Key key, @required this.scrollTo}) : super(key: key);

  @override
  _AuthCommonState createState() => _AuthCommonState();
}

class _AuthCommonState extends State<AuthCommon> {
  // AuthStore _auth;
  FirebaseUser user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // this._auth = AuthStore(currentUser: null);
    print('AUTHSTORE IS $this._authStore');
    // this._user = this._authStore.user;
    // print('user is $this._user');
  }

  @override
  void initState() {
    super.initState();
  }

  void signIn(AuthType type) async {
    dynamic result;
    switch (type) {
      case AuthType.Facebook:
        result = await widget._auth.signInAnonymously();
        break;
      case AuthType.Google:
        print('google!');
        result = await widget._auth.signInWithGoogle();
        break;
      case AuthType.Vkontakte:
        result = await widget._auth.signInAnonymously();
        break;
      case AuthType.Twitter:
        result = await widget._auth.signInAnonymously();
        break;
      default:
        break;
    }

    if (result == null) {
      print('error signin in');
    } else {
      print('signed in');
      setState(() {
        this.user = result.user;
        // this._store.$auth.currentUser = result.user;
      });
      // print(this._store.$auth.currentUser.isAnonymous);
      // print(this._store.$auth.currentUser.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 30.0),
          child: Text(
            'Login width',
            style: AppBigTitle,
          ),
        ),
        GestureDetector(
          onTap: () => this.signIn(AuthType.Facebook),
          child: AuthActionWidget(type: AuthType.Facebook),
        ),
        GestureDetector(
          onTap: () => this.signIn(AuthType.Google),
          child: AuthActionWidget(type: AuthType.Google),
        ),
        GestureDetector(
          onTap: () => this.signIn(AuthType.Vkontakte),
          child: AuthActionWidget(type: AuthType.Vkontakte),
        ),
        GestureDetector(
          onTap: () => this.signIn(AuthType.Twitter),
          child: AuthActionWidget(type: AuthType.Twitter),
        ),
        Container(
          margin: EdgeInsets.only(top: 30.0),
          child: anonymousAuthButton(),
        ),
        StoreConnector(
          conditionalCallback: (GlobalStore store) {
            if (this.user != null) {
              store.$auth.currentUser = this.user;
              return true;
            } else if (store.$auth.currentUser != null) {
              return true;
            } else {
              return false;
            }
          },
          builder: (GlobalStore store) {
            print('build');
            String text = store.$auth.currentUser.uid;
            return Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            );
          },
        )
        // StoreConnector(
        //   builder: (store) {
        //     store.$auth.currentUser = this.user;
        //     return Container();
        //   },
        // ),
        // StoreConnector(builder: (store) {
        //   return Text(
        //     store.$auth.currentUser != null
        //         ? store.$auth.currentUser.uid
        //         : 'huitam',
        //   );
        // })
      ],
    );
  }

  Widget anonymousAuthButton() {
    return MaterialButton(
      onPressed: () {
        print('scrolltoo');
        widget.scrollTo('Continue');
      },
      color: Colors.black,
      splashColor: Colors.white70,
      elevation: 3,
      textColor: Colors.white,
      padding: EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.transparent)),
      child: Text('Or continue anonymously'),
    );
  }
}

// class Example extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     AuthStore store = AuthStore.of(context);
//     return Container(
//       child: Text(
//         store.user is FirebaseUser ? store.user.uid : '',
//         style: TextStyle(fontSize: 16.0, decoration: TextDecoration.none),
//       ),
//     );
//   }
// }

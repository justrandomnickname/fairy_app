import 'package:flutter/material.dart';
import './instances/AuthStore.dart';

class GlobalStore extends InheritedWidget {
  final AuthStore $auth;
  GlobalStore({@required this.$auth, Key key, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(GlobalStore prevState) =>
      identical(this.$auth.currentUser, prevState.$auth.currentUser);

  static GlobalStore of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: GlobalStore);
  }

  static GlobalStore provide({@required Widget child}) {
    //declaring initial state
    print('render GlobalStore');
    final AuthStore _auth = AuthStore(currentUser: null);
    return GlobalStore(
      $auth: _auth,
      child: child,
    );
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

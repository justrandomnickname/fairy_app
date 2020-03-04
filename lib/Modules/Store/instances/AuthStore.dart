import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthStore {
  FirebaseUser currentUser;
  AuthStore({@required this.currentUser});

  call() {
    print('CALLME!!');
  }
}

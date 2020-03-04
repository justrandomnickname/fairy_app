import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly']);
  FirebaseUser _currentUser;
  static bool isListen = false;

  AuthService() {
    this.authListener();
  }

  authListener() {
    if (!AuthService.isListen) {
      print('Start auth listening');
      AuthService._auth.onAuthStateChanged.listen((FirebaseUser user) async {
        if (user != null) {
          print('isAnonymous?: ${user.isAnonymous}');
          print('UID: ${user.uid}');
          print(user.email);
          // String token = await this.getIdToken(user);
          // print('TOKEN: $token');
        }
      });
      AuthService.isListen = true;
    }
  }

  Future<String> getIdToken(FirebaseUser user) async {
    IdTokenResult result = await user.getIdToken();
    if (result is IdTokenResult) {
      return result.token;
    }
    return 'NO_TOKEN';
    // print(token.runtimeType);
  }

  setCurrentUser(AuthResult result) {
    this._currentUser = result.user;
  }

  Future<FirebaseUser> getCurrentUser() async {
    if (this._currentUser != null) {
      print('User existed');
      return this._currentUser;
    } else {
      print('User doesnt exist. start retrieving from firebase');
      this._currentUser = await AuthService._auth.currentUser();
      return this._currentUser;
    }
  }

  //sign in anon
  Future signInAnonymously() async {
    try {
      AuthResult result = await AuthService._auth.signInAnonymously();
      this.setCurrentUser(result);
      return result;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with google
  Future signInWithGoogle() async {
    try {
      await this._googleSignIn.signIn();
      // final authHeaders = this._googleSignIn.currentUser.authHeaders;
      final GoogleSignInAccount account = this._googleSignIn.currentUser;
      final GoogleSignInAuthentication authentication =
          await account.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken);
      final AuthResult result =
          await AuthService._auth.signInWithCredential(credential);

      this.setCurrentUser(result);
      final FirebaseUser user = await this.getCurrentUser();

      print('Firebase user is ${user.email}');
      print('Google account is: ${account.email}');
    } catch (e) {
      print(e);
    }
  }

  //sign in with phone
  // Future signInWithPhone() async {
  //   try {
  //     await AuthService._auth.verifyPhoneNumber(
  //       phoneNumber: null,
  //       timeout: null,
  //       verificationCompleted: null,
  //       verificationFailed: null,
  //       codeSent: null,
  //       codeAutoRetrievalTimeout: null,
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // sign in with email @ password

  // register with email @ password

  // sign out
  Future signOut() async {
    try {
      await AuthService._auth.signOut().whenComplete(() {
        print('SIGNED OUT!');
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

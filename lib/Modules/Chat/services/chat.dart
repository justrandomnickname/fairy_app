import 'package:firebase_auth/firebase_auth.dart';
import 'package:socket_io_flutter/socket_io_flutter.dart';

class ChatService {
  SocketIOManager _manager = SocketIOManager();
  SocketIO _socket;
  bool isAuthed = false;

  ChatService();

  void setAuthContext(FirebaseUser user) async {
    print('hello');
    String token = await user.getIdToken().then((value) => value.token);
    this._socket = await this._manager.createInstance(
          SocketOptions('http://localhost:3332/',
              query: {'id_token': '$token'}),
        );

    this._socket.onConnect((data) {
      print('connected...');
      print(data);
    });
    this._socket.connect();
    this.isAuthed = true;
    // this._connect();
  }

  void _connect() {
    if (this.isAuthed) {
      print('start connecting');
      this._socket.emit("connect_user", []);
    }
  }

  // void _subscribe() {
  //   if (this._socketIO != null) {
  //     this._socketIO.subscribe("receive_message");
  //   }
  // }
}

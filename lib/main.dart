import 'package:flutter/material.dart';
import './Modules/Thread/Thread.dart';
import './Modules/Store/index.dart';
import './Modules/Chat/Chat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
          textDirection: TextDirection.ltr,
          child: StoreProvider(
            store: GlobalStore.provide(
              child: Chat(),
            ),
          )),
    );
  }
}

import 'package:flutter/widgets.dart';

class StoreProvider extends StatefulWidget {
  final InheritedWidget store;
  StoreProvider({Key key, @required this.store}) : super(key: key);
  @override
  _StoreProdiverState createState() => _StoreProdiverState();
}

class _StoreProdiverState extends State<StoreProvider> {
  @override
  Widget build(BuildContext context) {
    return widget.store;
  }
}

import 'package:flutter/widgets.dart';
import '../GlobalStore.dart';

class StoreConnector extends StatefulWidget {
  final Function builder;
  final Function conditionalCallback;
  StoreConnector({Key key, @required this.builder, this.conditionalCallback})
      : super(key: key);
  @override
  _StoreConnectorState createState() => _StoreConnectorState();
}

class _StoreConnectorState extends State<StoreConnector> {
  @override
  Widget build(BuildContext context) {
    print('render');
    GlobalStore store = GlobalStore.of(context);
    if (widget.conditionalCallback != null) {
      dynamic condition = widget.conditionalCallback(store);
      if (condition is bool) {
        if (condition) return widget.builder(store);
        if (!condition) return Container();
      }
      if (condition is Widget) {
        return condition;
      }
    }
    return widget.builder(store);
  }
}

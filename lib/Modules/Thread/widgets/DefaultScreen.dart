import 'package:flutter/widgets.dart';
import 'package:fairy_app/Assembly/Platform.dart';

class DefaultScreen extends StatelessWidget {
  final Widget child;
  DefaultScreen({@required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AppBouncingScrollPhysics(),
      child: Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.5,
            minHeight: MediaQuery.of(context).size.height * 1.01,
          ),
          child: Center(
            child: this.child,
          ),
        ),
      ),
    );
  }
}

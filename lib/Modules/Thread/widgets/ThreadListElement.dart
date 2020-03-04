import 'package:flutter/widgets.dart';
import '../models/Item.dart';
import '../widgets/DefaultScreen.dart';
import 'package:fairy_app/Modules/UI/index.dart';
import './Tags.dart';
import '../models/Tag.dart';

abstract class ThreadTheme {
  static final List<Tag> _tagMock = [
    new Tag(text: '#Tag 1'),
    new Tag(text: '#Tag 2'),
    new Tag(text: '#Tag tag tag'),
    new Tag(text: '#kripovva(223)'),
    new Tag(text: '#kitty-kat aaan(223)'),
    new Tag(text: '#Atleastihaveacat(3453)')
  ];

  static Container threadContainer({@required Widget child}) {
    return Container(
        // decoration: BoxDecoration(border: Border.all()),
        margin: EdgeInsets.only(top: 30.0),
        padding: EdgeInsets.only(bottom: 100.0),
        child: Padding(padding: EdgeInsets.all(10), child: child));
  }

  static const TextStyle titleStyle =
      TextStyle(color: Color.fromRGBO(55, 55, 55, 1), fontSize: 30);
  static const TextStyle textStyle =
      TextStyle(color: Color.fromRGBO(55, 55, 55, 1), fontSize: 15);

  static Column stack({@required String name, @required String text}) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 50.0, top: 50.0),
          child: Text(name, style: AppBigTitle),
        ),
        Text(text, style: standardText),
        Container(
          margin: EdgeInsets.only(top: 20.0),
          child: Tags(tags: ThreadTheme._tagMock),
        ),
      ],
    );
  }
}

class ThreadListElement extends StatelessWidget {
  final Item item;
  ThreadListElement({@required this.item});
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      child: ThreadTheme.threadContainer(
        child: ThreadTheme.stack(name: this.item.name, text: this.item.text),
      ),
    );
  }
}

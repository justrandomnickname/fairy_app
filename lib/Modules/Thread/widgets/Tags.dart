import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fairy_app/Modules/UI/index.dart';
import '../models/Tag.dart';

class Tags extends StatelessWidget {
  final List<Tag> tags;
  Tags({@required this.tags});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children: <Widget>[for (final _tag in tags) _tagBuilder(_tag)],
    );
  }

  Widget _tagBuilder(Tag tag) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.all(7.0),
      margin: EdgeInsets.all(4.0),
      child: Text(
        tag.text,
        style: SmallTextInversed,
      ),
    );
  }
}

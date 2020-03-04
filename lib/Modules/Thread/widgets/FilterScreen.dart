import 'package:fairy_app/Modules/UI/widgets/TextStyles.dart';
import 'package:flutter/material.dart';
import '../models/Tag.dart';
import './Tags.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<Tag> _tags = [];

  @override
  void initState() {
    super.initState();
    this.setState(() {
      this._tags.add(new Tag(text: 'Tag 1'));
      this._tags.add(new Tag(text: 'Tag 2'));
      this._tags.add(new Tag(text: 'Tag example'));
      this._tags.add(new Tag(text: 'Example tag'));
      this._tags.add(new Tag(text: 'Technologu'));
      this._tags.add(new Tag(text: 'Kotiki'));
      this._tags.add(new Tag(text: 'Narkotiki'));
      this._tags.add(new Tag(text: 'Ya ebu kotov'));
      this._tags.add(new Tag(text: 'Ya_kotoeb'));
      this._tags.add(new Tag(text: 'Vodka(1345)'));
      this._tags.add(new Tag(text: 'nasvai nedorogo(999)'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Chosen tags',
              style: AppTitle,
            ),
          ),
        ),
        Tags(tags: this._tags)
      ],
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

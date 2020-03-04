import 'package:fairy_app/Modules/Auth/widgets/AuthCommon.dart';
import 'package:fairy_app/Modules/Thread/widgets/FilterScreen.dart';
import 'package:fairy_app/Modules/Auth/widgets/OAuthDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './widgets/ThreadListElement.dart';
import './widgets/SuggestionMenu.dart';
import './widgets/DefaultScreen.dart';
import './models/Item.dart';

class ThreadConstants {
  // Defines how many additional pages exists on screen excepts pages from item list.
  // if you want to add or remove static page, please, change this value too.
  static const ADDITIONAL_PAGES = 2;
}

class Thread extends StatefulWidget {
  const Thread({Key key}) : super(key: key);
  @override
  _ThreadState createState() => _ThreadState();
}

class _ThreadState extends State<Thread> {
  final List<Item> _items = [];
  final Curve _scrollAnimationCurve = Curves.easeOutCubic;
  final Duration _scrollAnimationDuration = Duration(milliseconds: 350);
  PageController _controller = new PageController(initialPage: 0);
  bool _isScrolling = false;
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      this._items.add(new Item(
          name: 'Priscilla',
          text:
              'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec elit ullamcorper tellus blandit aliquam. Quisque posuere lorem sed nulla maximus tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lacus sem, imperdiet quis metus ac, dictum mattis eros. Pellentesque varius dapibus sem, a volutpat dui consequat ut. Proin non volutpat purus, eget varius purus. Aenean ex erat, molestie eget ornare in, sodales vitae dui. Sed at blandit felis, vitae suscipit nunc. Donec semper est sit amet augue dapibus dapibus. Nulla nec enim velit. Nam dignissim, neque et tempor viverra, augue tortor interdum justo, vel congue neque mauris eget mi. Aenean ex neque, aliquet sit amet nisi sed, tincidunt laoreet dui. Fusce gravida ante lorem, eget aliquet turpis sodales mollis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec elit ullamcorper tellus blandit aliquam. Quisque posuere lorem sed nulla maximus tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lacus sem, imperdiet quis metus ac, dictum mattis eros. Pellentesque varius dapibus sem, a volutpat dui consequat ut. Proin non volutpat purus, eget varius purus. Aenean ex erat, molestie eget ornare in, sodales vitae dui. Sed at blandit felis, vitae suscipit nunc. Donec semper est sit amet augue dapibus dapibus. Nulla nec enim velit. Nam dignissim, neque et tempor viverra, augue tortor interdum justo, vel congue neque mauris eget mi. Aenean ex neque, aliquet sit amet nisi sed, tincidunt laoreet dui. Fusce gravida ante lorem, eget aliquet turpis sodales mollis.'));
      this._items.add(new Item(
          name: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent et felis a lectus dictum rutrum vel quis leo. Sed ut nisl sed nulla posuere efficitur. Sed suscipit pulvinar magna id vulputate. Vivamus dignissim ultrices ligula. Proin est leo, porta eu pellentesque non, mattis vitae enim. Donec malesuada libero tortor, a venenatis tellus egestas at. Fusce ultrices eu nibh quis commodo. In hac habitasse platea dictumst. Maecenas bibendum massa nec neque sagittis, a bibendum dolor vestibulum. Nulla ut enim non nisl interdum accumsan. Pellentesque blandit non est id imperdiet. Maecenas semper nibh dignissim ligula semper, eget faucibus nibh congue. Nulla facilisi. Nam fermentum magna rhoncus tellus porttitor, eu tincidunt purus lobortis. Quisque gravida, risus eget faucibus ullamcorper, ipsum neque mattis urna, sed cursus ligula massa a est.'));
      this._items.add(new Item(
          name: 'Emily',
          text:
              'In mollis dolor et risus posuere finibus. Proin dignissim finibus felis, nec semper nunc efficitur ac. Vivamus at nibh ac sapien aliquam suscipit eget ut tellus. Nulla sit amet mattis nibh. Suspendisse facilisis risus in ex pretium tincidunt. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla egestas dapibus velit quis mollis. Sed condimentum porta auctor. Ut a lorem diam. Mauris molestie, magna sit amet porttitor efficitur, dui justo facilisis magna, at posuere purus urna a sem. Curabitur fermentum nunc quis ornare luctus. Aenean viverra massa dolor, in pretium ex faucibus sed. Sed aliquam nulla elit, at accumsan nulla vulputate quis.'));
      this._items.add(new Item(
          name: 'Mark',
          text:
              'In mollis dolor et risus posuere finibus. Proin dignissim finibus felis, nec semper nunc efficitur ac. Vivamus at nibh ac sapien aliquam suscipit eget ut tellus. Nulla sit amet mattis nibh. Suspendisse facilisis risus in ex pretium tincidunt. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla egestas dapibus velit quis mollis. Sed condimentum porta auctor. Ut a lorem diam. Mauris molestie, magna sit amet porttitor efficitur, dui justo facilisis magna, at posuere purus urna a sem. Curabitur fermentum nunc quis ornare luctus. Aenean viverra massa dolor, in pretium ex faucibus sed. Sed aliquam nulla elit, at accumsan nulla vulputate quis.'));
    });
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }

  void setActiveMenu(double page) {
    this.setState(() {
      if (page <= ThreadConstants.ADDITIONAL_PAGES - 1)
        this.isActive = false;
      else if (page != 0.0) this.isActive = true;
    });
  }

  void setScrollingState(bool state) {
    this._isScrolling = state;
  }

  void scrollDown() {
    if (this._controller.page.round() !=
            (this._items.length - 1) + ThreadConstants.ADDITIONAL_PAGES &&
        !this._isScrolling) {
      this._isScrolling = true;
      this.setActiveMenu(this._controller.page + 1.0);
      this._controller.animateToPage(
            this._controller.page.round() + 1,
            duration: this._scrollAnimationDuration,
            curve: this._scrollAnimationCurve,
          );
    } else if (this._controller.page.round() ==
            (this._items.length - 1) + ThreadConstants.ADDITIONAL_PAGES &&
        !this._isScrolling) {
      this._isScrolling = true;
      this.setActiveMenu(0.0);
      this._controller.animateToPage(0,
          duration: Duration(milliseconds: this._items.length * 100),
          curve: Curves.easeInToLinear);
    }
  }

  void scrollUp() {
    if (!this._isScrolling) {
      this._isScrolling = true;
      this.setActiveMenu(this._controller.page - 1.0);
      this._controller.animateToPage(
            this._controller.page.round() - 1,
            duration: this._scrollAnimationDuration,
            curve: this._scrollAnimationCurve,
          );
    }
  }

  void scrollTo(String page) {
    num pageNum = 0;

    switch (page) {
      case 'Filter':
        pageNum = 1;
        break;
      case 'Continue':
        pageNum = 2;
        break;
      default:
        break;
    }
    if (!this._isScrolling) {
      this._isScrolling = true;
      this._controller.animateToPage(
            pageNum,
            duration: this._scrollAnimationDuration,
            curve: this._scrollAnimationCurve,
          );
    }
  }

  void onScroll(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollUpdateNotification) {
      if (scrollNotification.metrics.outOfRange &&
          scrollNotification.metrics.pixels >
              scrollNotification.metrics.maxScrollExtent + 100) {
        this.scrollDown();
      } else if (scrollNotification.metrics.outOfRange &&
          scrollNotification.metrics.pixels <
              scrollNotification.metrics.minScrollExtent - 100) {
        this.scrollUp();
      }
    } else if (scrollNotification is ScrollEndNotification) {
      this.setActiveMenu(this._controller.page);
      if (this._isScrolling) {
        this._isScrolling = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollNotification) {
            this.onScroll(scrollNotification);
            return true;
          },
          child: Container(
            color: Color.fromRGBO(255, 255, 255, 1),
            child: PageView(
              controller: this._controller,
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              children: <Widget>[
                DefaultScreen(
                  child: AuthCommon(
                    scrollTo: this.scrollTo,
                  ),
                ),
                DefaultScreen(
                  child: FilterScreen(),
                ),
                for (final _item in _items) ThreadListElement(item: _item),
              ],
            ),
          ),
        ),
        ThreadSuggestionMenu(isActive: this.isActive),
        // OAuthDialog(),
      ],
    );
  }
}

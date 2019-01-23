import 'package:catbox/model/cat.dart';
import 'package:flutter/material.dart';
import 'package:catbox/ui/cat_details/footer/showcase_cattributes.dart';
import 'package:catbox/ui/cat_details/footer/showcase_details.dart';
import 'package:catbox/ui/cat_details/footer/showcase_pictures.dart';


class CatShowcase extends StatefulWidget {
  final Cat cat;

  CatShowcase(this.cat);

  @override
  _CatShowcaseState createState() => new _CatShowcaseState();
}

class _CatShowcaseState extends State<CatShowcase>
    with TickerProviderStateMixin {

  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabs = [
      new Tab(text: 'Pictures'),
      new Tab(text: 'Details'),
      new Tab(text: 'Cattributes')
    ];
    _pages = [
      new PicturesShowcase(widget.cat),
      new DetailsShowcase(widget.cat),
      new CattributesShowcase(widget.cat),
    ];
    _controller = new TabController(
      length: _tabs.length,
      vsync: this,
    );
  }



  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          new TabBar(
            controller: _controller,
            tabs: _tabs,
            indicatorColor: Colors.white,
          ),
          new SizedBox.fromSize(
            size: const Size.fromHeight(300.0),
            child: new TabBarView(
              controller: _controller,
              children: _pages,
            ),
          )
        ],
      )
    );
  }
}

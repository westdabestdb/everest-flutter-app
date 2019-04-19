import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  double appBarTop = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool x) {
          return [
            SliverAppBar(
              actions: <Widget>[
                IconButton(
                  icon: CircleAvatar(
                    radius: 40.0,
                    child: ClipOval(
                      child: Image.network(
                        "https://lh3.googleusercontent.com/-u4Dy4Xa2rPg/AAAAAAAAAAI/AAAAAAAAAAA/ACHi3rfwO342JV5PKWJ6gAOqFDW5eFer6A/mo/photo.jpg?sz=64",
                      ),
                    ),
                  ),
                  onPressed: () {},
                )
              ],
              expandedHeight: 244,
              floating: false,
              forceElevated: false,
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.white,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                appBarTop = constraints.biggest.height;
                return FlexibleSpaceBar(
                  title: Text(
                    appBarTop > 180
                        ? "Hey Matt,\nthis is your to-do list."
                        : "Hey Matt!",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                  centerTitle: false,
                  titlePadding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ).add(EdgeInsets.only(bottom: appBarTop / 4 + 28)),
                  collapseMode: CollapseMode.parallax,
                );
              }),
              bottom: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black87,
                unselectedLabelColor: Color(0xff5f6368),
                labelStyle: TextStyle(fontWeight: FontWeight.w600),
                indicator: MD2Indicator(
                    //it begins here
                    indicatorHeight: 3,
                    indicatorColor: Colors.indigoAccent,
                    indicatorSize: MD2IndicatorSize
                        .normal //3 different modes tiny-normal-full
                    ),
                tabs: <Widget>[
                  Tab(
                    text: "TODAY",
                  ),
                  Tab(
                    text: "WEEK",
                  ),
                  Tab(
                    text: "MONTH",
                  )
                ],
              ),
            ),
          ];
        },
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(100, (index) {
            return _block(
              index,
            );
          }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 64,
        ),
        shape: CircularNotchedRectangle(
        )
        ,
      ),
    );
  }

  Widget _block(int index) {
    return Padding(
      padding: EdgeInsets.only(
        left: index % 2 == 0 ? 16 : 8,
        right: index % 2 == 0 ? 8 : 16,
        bottom: 16,
      ),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        elevation: 1,
        child: Container(
          child: Text("qwe"),
        ),
      ),
    );
  }
}

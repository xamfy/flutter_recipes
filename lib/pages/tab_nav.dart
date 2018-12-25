import 'package:flutter/material.dart';
import 'package:flutter_chat/tab_nav_pages.dart';

class TabNavWidget extends StatefulWidget {
  _TabNavWidgetState createState() => _TabNavWidgetState();
}

class _TabNavWidgetState extends State<TabNavWidget>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: new Text("TabBar Nav"),
        backgroundColor: Colors.blueAccent,
        bottom: new TabBar(
          controller: controller,
          tabs: <Tab>[
            Tab(icon: Icon(Icons.message)),
            Tab(icon: Icon(Icons.dehaze)),
            Tab(icon: Icon(Icons.face)),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          FirstPage(),
          SecondPage(),
          ThirdPage(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.blueAccent,
        child: TabBar(
          controller: controller,
          tabs: <Tab>[
            Tab(icon: Icon(Icons.message)),
            Tab(icon: Icon(Icons.dehaze)),
            Tab(icon: Icon(Icons.face)),
          ],
        ),
      ),
    );
  }
}

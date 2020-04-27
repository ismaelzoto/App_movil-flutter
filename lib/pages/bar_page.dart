import 'package:flutter/material.dart';
import 'package:itca/pages/tabEvent.dart';
import 'package:itca/pages/tabHome.dart';
import 'package:itca/pages/tabInbox.dart';

class BarPage extends StatefulWidget{
   BarPage({Key key}) : super(key: key);
  
  @override
  _BarPageState createState() => _BarPageState();
}
class _BarPageState extends State<BarPage> with SingleTickerProviderStateMixin{
  TabController _tabController;

        final _kTabPages = <Widget>[
            new TabHome(),
            new TabInbox(),
            new TabEvent(),
            
          ],

   _kTabs = <Tab>[
    Tab(icon: Icon(Icons.home), text: 'Home'),
    Tab(icon: Icon(Icons.inbox), text: 'Mensajes'),
    Tab(icon: Icon(Icons.settings), text: 'Configuracion'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: TabBarView(
        children: _kTabPages,
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.deepPurple,
        child: TabBar(
          indicatorColor: Colors.lightBlueAccent,
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}
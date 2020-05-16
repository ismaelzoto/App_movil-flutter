import 'package:flutter/material.dart';
import 'package:itca/pages/maps_page.dart';
import 'package:itca/pages/tabEvent.dart';
import 'package:itca/pages/tabHome.dart';
import 'package:itca/pages/tabInbox.dart';

class BarPage extends StatefulWidget{
   BarPage({Key key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _BarPageState();
}
//Tab bar
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

void _newTaskModalBottomSheet(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
          return Container(
            child: new Wrap(
            children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.music_note),
            title: new Text('Music'),
            onTap: () => {}          
          ),
          new ListTile(
            leading: new Icon(Icons.videocam),
            title: new Text('Video'),
            onTap: () => {},          
          ),
          new ListTile(
            leading: new Icon(Icons.layers),
            title: new Text('Mapas'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Mapspage())),          
          ),
            ],
          ),
          );
      }
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: TabBarView(
        children: _kTabPages,
        controller: _tabController,
      ),
       floatingActionButton: FloatingActionButton(
         backgroundColor: Colors.deepPurple,
         foregroundColor: Colors.lightBlueAccent,
        onPressed: (){ //Navigator.push(context, MaterialPageRoute(builder: (context) => Mapspage()));
         _newTaskModalBottomSheet(context);
        },
        child: new Icon(Icons.add),
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


// BAR BotomNavigatorBar
//class _BarPageState extends State<BarPage> {

//  int _tabindex=0;
//       @override
//       Widget build(BuildContext context) {
//         final _kTabPages = <Widget>[
//             new TabHome(),
//             new TabInbox(),
//             new TabEvent(),
//           ];
//     final _kTabs = <BottomNavigationBarItem>[
//     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
//     BottomNavigationBarItem(icon: Icon(Icons.inbox), title: Text('Mensajes')),
//     BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('Configuración')),
//     ];

// assert(_kTabPages.length == _kTabs.length);
//   final bottomNavBar = BottomNavigationBar(
//       items: _kTabs,
//       currentIndex: _tabindex,
//       type: BottomNavigationBarType.fixed,
//       onTap: (int index){
//         setState(() {
//           _tabindex = index;
//         });
//       },
//   ); 
//       return Scaffold(
//        body: _kTabPages[_tabindex],
//        bottomNavigationBar: bottomNavBar,
//     );
//   }
// }
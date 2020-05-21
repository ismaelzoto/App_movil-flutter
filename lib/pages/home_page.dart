import 'package:flutter/material.dart';
import 'package:itca/pages/bar_page.dart';
import 'package:itca/pages/maps_page.dart';

class HomePage extends StatelessWidget {
    const HomePage({Key key}) : super(key: key);
    
    @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('User Name'),
      accountEmail: Text('user.name@email.com'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 45.0),
        backgroundColor: Colors.white,
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          child: Text('A'),
          backgroundColor: Colors.lightBlue,
        ),
        CircleAvatar(
          child: Text('B'),
          backgroundColor: Colors.lightGreen,
        )
      ],
    );
     ListTile(
              title: Text(
                'Log Out',
                style: TextStyle(fontSize: 20.0),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
                Navigator.pop(context);
              },
     );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        // ListTile(
        //   title: Text('To page 1'),
        //   onTap: () => Navigator.of(context).push(_NewPage(1)),
        // ),
        ListTile(
          title: Text('Ir a Mapas'),
          onTap: () => Navigator.of(context).push(_NewPage(1)),
        ),
        ListTile(
          title: Text('other drawer item'),
          onTap: () => {},
        ),
      ],
    );     
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('LunchTime'),
        ),
        body: Center(
          child: BarPage(),
        ),
        drawer: Drawer(
          child: drawerItems,
        ));
  }
}

// <Null> means this route returns nothing.
class _NewPage extends MaterialPageRoute<Null> {
  _NewPage(int id)
      : super(builder: (BuildContext context) {
          return Scaffold(
            // appBar: AppBar(
            //   title: Text('Mapa'),
             // elevation: 1.0,
            //),
            body: Center(
              child: Mapspage(),
            ),
          );
        });
}






//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('LunchTime'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             Container(
//               child: DrawerHeader(
//                 child: Column(
//                   children: <Widget>[
//                     Icon(
//                       Icons.account_circle,
//                       size: 70.0,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 'Log Out',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//               onTap: () {
//                 Navigator.pushReplacementNamed(context, '/login');
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//        body: Container(
//          child: Center(
//            child: BarPage(),
//        ),
//       ),
//     );
//   }
// }

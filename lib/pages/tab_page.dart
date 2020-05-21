import 'package:flutter/material.dart';
import 'package:itca/bloc/provider.dart';
import 'package:itca/models/producto_model.dart';
import 'package:itca/providers/productos_provider.dart';

class TabPage extends StatelessWidget {
  final productosProvider= new ProductosProvider();
  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('LunchTime')   
      // ),
      body:  _crearListado(),
      floatingActionButton: _crearBoton(context), 
    );
  }

  Widget _crearListado(){
    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>>  snapshot){
        if ( snapshot.hasData ) {
          final productos=snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i)=>_crearItem(context, productos[i]),
          );

        } else {
          return Center( child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductoModel producto){
    return Dismissible(
      key: UniqueKey(),
      background: Container(
      color: Colors.red
      
    ),
    onDismissed: (direccion){
      productosProvider.borrarProducto(producto.id);

    },
    child: ListTile(
      title: Text('${ producto.titulo } - ${ producto.valor }'),
              subtitle: Text( producto.id ),
              onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto ),
    ),
    );
  }

  _crearBoton(BuildContext context){
  return FloatingActionButton(
    child: Icon(Icons.add),
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.lightBlueAccent,
    onPressed: ()=>Navigator.pushNamed(context, 'producto'),
  );
  } 


}

// class TabInbox extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new Center(
//       child: new Text(
//         "Tab Inbox",
//         style: new TextStyle(fontSize: 25.0),
//       ),
//     );
//   }
// }
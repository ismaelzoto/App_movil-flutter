import 'package:flutter/material.dart';
import 'package:itca/models/producto_model.dart';
import 'package:itca/providers/productos_provider.dart';
import 'package:itca/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey=GlobalKey<FormState>();
  final scaffoldKey=GlobalKey<ScaffoldState>();
  final productoProvider= new ProductosProvider();

  ProductoModel producto= new  ProductoModel();
  bool _guardando = false;
  

  @override
  Widget build(BuildContext context) {
    final ProductoModel prodData= ModalRoute.of(context).settings.arguments;
    if ( prodData != null ) {
      producto = prodData;
    }
    
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Desayunos'), 
              ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton(),
                
                
              ],
            ),
         ),
        ),
      ),
    );
}

Widget _crearNombre(){
  return TextFormField(
    initialValue: producto.titulo,
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      labelText: 'Desayuno'
    ),
    onSaved: (value)=> producto.titulo=value,
    validator: (value){
      if(value.length < 3){
        return 'Ingrese el nombre del producto';
      }else{
        return null;
      }

    },
  );

}

Widget _crearPrecio(){
return TextFormField(
  initialValue: producto.valor.toString(),
    keyboardType: TextInputType.numberWithOptions(decimal:true),
    decoration: InputDecoration(
      labelText: 'Precio'
    ),
    onSaved: (value)=> producto.valor= double.parse(value),
    validator: (value){
      if (utils.isNumeric(value)){
        return null;
      }else{
        return 'solo numeros';
      }
    }
  );
}

Widget _crearDisponible(){
  return SwitchListTile(
    value: producto.disponible, 
    title: Text('Disponible'),
    activeColor: Colors.blueAccent,
    onChanged: (value)=> setState ((){
      producto.disponible=value;
    }),
  
  );
}

Widget _crearBoton(){
  return RaisedButton.icon(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.circular(80.0)
    ),
    color: Colors.blueGrey,
    textColor: Colors.white,
    label: Text('Enviar'),
    icon: Icon(Icons.save),
    onPressed:(_guardando) ? null: _submit,
  );
}

void  _submit(){
if ( !formKey.currentState.validate() ) return;

    formKey.currentState.save();
setState(() {_guardando = true;});



    if ( producto.id == null ) {
      productoProvider.crearProducto(producto);
    } else {
      productoProvider.editarProducto(producto);
    }
setState(() { _guardando = false;});    
mostrarSnackbar('Registro guardado');

Navigator.pop(context);
    
}

void mostrarSnackbar(String mensaje) {

    final snackbar = SnackBar(
      content: Text( mensaje ),
      duration: Duration( milliseconds: 2000),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);

  }

}
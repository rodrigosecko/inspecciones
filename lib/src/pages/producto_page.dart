import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/productos_provider.dart';
import 'package:formvalidation/src/utils/utils.dart' as utils;


class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  
  final formKey     = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final productoProvider = new ProductosProvider();

  String dropdownValue = 'Ninguno';
  String dropdownValue2 = 'Ninguno';

  ProductoModel producto = new ProductoModel();
  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {

    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;
    if ( prodData != null ) {
      producto = prodData;
    }
    
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Datos Predio'),
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.photo_size_select_actual ),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon( Icons.camera_alt ),
            onPressed: _tomarFoto,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearNombre(),
                _crearPropietario(),
                _crearCalle(),
                _crearZona(),
                _crearNumero(),
                _crearPrecio(),//frente
                _crearFondo(),
                _crearForma(),
                _crearEstado(),
                _crearDisponible(),
                _crearLuz(),
                _crearAguaPotable(),
                _crearAlcantarilladoPluvial(),
                _crearAlcantarilladoSanitario(),
                _crearAlumbradoPublico(),
                _crearGas(),
                _crearRecojoBasura(),
                _crearTelefono(),
                _crearTransportePublico(),
                _crearBoton()
              ],
            ),
          ),
        ),
      ),
    );

  }




Widget _crearForma() {
  return DropdownButton<String>(
    value: dropdownValue2,
    //icon: Icon(Icons.arrow_downward),
    iconSize: 24,
    elevation: 16,
    style: TextStyle(
      color: Colors.deepPurple
    ),
    underline: Container(
      height: 2,
      color: Colors.deepPurpleAccent,
    ),
    onChanged: (String newValue) {
      setState(() {
        dropdownValue2 = newValue;
        //producto.disponible = newValue;
      });
    },
    items: <String>['Ninguno',
'Rectangular',
'Cuadrangular',
'Poligonal',
'Hexagonal',
'Irregular',
'Pentagonal',
'Trapezoidal',
'Triangular',
'Muy irregular',
'No definido',
'Regular']
    //items: <String>['Bueno','Malo','Regular','Económico','Lujoso','Muy bueno']
      .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
      .toList(),
  );
}

Widget _crearEstado() {
  return DropdownButton<String>(
    value: dropdownValue,
    //icon: Icon(Icons.arrow_downward),
    iconSize: 24,
    elevation: 16,
    style: TextStyle(
      color: Colors.deepPurple
    ),
    underline: Container(
      height: 2,
      color: Colors.deepPurpleAccent,
    ),
    onChanged: (String newValue) {
      setState(() {
        dropdownValue = newValue;
        //producto.disponible = newValue;
      });
    },
    items: <String>['Ninguno','Bueno','Malo','Regular','Económico','Lujoso','Muy bueno','Marginal','Muy Económico','Interés Social','Excelente','En Ruinas','No Determinado']
    //items: <String>['Bueno','Malo','Regular','Económico','Lujoso','Muy bueno']
      .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
      .toList(),
  );
}

  Widget _crearNombre() {

    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      onSaved: (value) => producto.titulo = value,
      validator: (value) {
        if ( value.length < 3 ) {
          return 'Ingrese el nombre del producto';
        } else {
          return null;
        }
      },
    );

  }
  Widget _crearPropietario() {

    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Propietario'
      ),
      onSaved: (value) => producto.titulo = value,
      validator: (value) {
        if ( value.length < 3 ) {
          return 'Ingrese el nombre del Propietario';
        } else {
          return null;
        }
      },
    );

  }

  Widget _crearCalle() {

    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Calle'
      ),
      onSaved: (value) => producto.titulo = value,
      validator: (value) {
        if ( value.length < 3 ) {
          return 'Ingrese el nombre del producto';
        } else {
          return null;
        }
      },
    );


  }

  Widget _crearZona() {

    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Zona'
      ),
      onSaved: (value) => producto.titulo = value,
      validator: (value) {
        if ( value.length < 3 ) {
          return 'Ingrese el nombre del producto';
        } else {
          return null;
        }
      },
    );


  }



  Widget _crearNumero() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Numero'
      ),
      onSaved: (value) => producto.valor = double.parse(value),
      validator: (value) {

        if ( utils.isNumeric(value)  ) {
          return null;
        } else {
          return 'Sólo números';
        }

      },
    );
  }

  

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Frente'
      ),
      onSaved: (value) => producto.valor = double.parse(value),
      validator: (value) {

        if ( utils.isNumeric(value)  ) {
          return null;
        } else {
          return 'Sólo números';
        }

      },
    );
  }

  Widget _crearFondo() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Fondo'
      ),
      onSaved: (value) => producto.valor = double.parse(value),
      validator: (value) {

        if ( utils.isNumeric(value)  ) {
          return null;
        } else {
          return 'Sólo números';
        }

      },
    );
  }

  Widget _crearDisponible() {

    return SwitchListTile(
      value: producto.disponible,
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value)=> setState((){
        producto.disponible = value;
      }),
    );

  }

  Widget _crearLuz() {

    return SwitchListTile(
      value: producto.luz,
      title: Text('Energía Eléctrica'),
      activeColor: Colors.deepPurple,
      onChanged: (value)=> setState((){
        producto.luz = value;
      }),
    );

  }

  Widget _crearAguaPotable() {

    return SwitchListTile(
      value: producto.agua,
      title: Text('Agua Potable'),
      activeColor: Colors.deepPurple,
      onChanged: (value)=> setState((){
        producto.agua = value;
      }),
    );

  }
   Widget _crearAlcantarilladoPluvial() {

    return SwitchListTile(
      value: producto.pluvial,
      title: Text('Alcantarillado Pluvial'),
      activeColor: Colors.deepPurple,
      onChanged: (value)=> setState((){
        producto.pluvial = value;
      }),
    );

  }

    Widget _crearAlcantarilladoSanitario() {

    return SwitchListTile(
      value: producto.sanitario,
      title: Text('Alcantarillado Sanitario'),
      activeColor: Colors.deepPurple,
      onChanged: (value)=> setState((){
        producto.sanitario = value;
      }),
    );

  }

      Widget _crearAlumbradoPublico() {

    return SwitchListTile(
      value: producto.alumbrado,
      title: Text('Alumbrado Publico'),
      activeColor: Colors.deepPurple,
      onChanged: (value)=> setState((){
        producto.alumbrado = value;
      }),
    );

  }
 

      Widget _crearGas() {

    return SwitchListTile(
      value: producto.gas,
      title: Text('Gas Domiciliario'),
      activeColor: Colors.deepPurple,
      onChanged: (value)=> setState((){
        producto.gas = value;
      }),
    );

  }
      Widget _crearRecojoBasura() {

    return SwitchListTile(
      value: producto.basura,
      title: Text('Recojo de Basura'),
      activeColor: Colors.deepPurple,
      onChanged: (value)=> setState((){
        producto.basura = value;
      }),
    );

  }
  
    Widget _crearTelefono() {

    return SwitchListTile(
      value: producto.telefono,
      title: Text('Telefono'),
      activeColor: Colors.deepPurple,
      onChanged: (value)=> setState((){
        producto.telefono = value;
      }),
    );

  }

    Widget _crearTransportePublico() {

    return SwitchListTile(
      value: producto.transporte,
      title: Text('Transporte Publico'),
      activeColor: Colors.deepPurple,
      onChanged: (value)=> setState((){
        producto.transporte = value;
      }),
    );

  }



  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon( Icons.save ),
      onPressed: ( _guardando ) ? null : _submit,
    );
  }

  void _submit() async {

    

    if ( !formKey.currentState.validate() ) return;

    formKey.currentState.save();

    setState(() {_guardando = true; });

    if ( foto != null ) {
      producto.fotoUrl = await productoProvider.subirImagen(foto);
    }



    if ( producto.id == null ) {
      productoProvider.crearProducto(producto);
    } else {
      productoProvider.editarProducto(producto);
    }


    // setState(() {_guardando = false; });
    mostrarSnackbar('Registro guardado');

    Navigator.pop(context);

  }


  void mostrarSnackbar(String mensaje) {

    final snackbar = SnackBar(
      content: Text( mensaje ),
      duration: Duration( milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);

  }


  Widget _mostrarFoto() {

    if ( producto.fotoUrl != null ) {
      
      return FadeInImage(
        image: NetworkImage( producto.fotoUrl ),
        placeholder: AssetImage('assets/jar-loading.gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );

    } else {
      

      return Center(
        child: foto == null
            ? Text('Ninguna Imagen Seleccionada.',style: TextStyle(color: Colors.red[300]))
            : Image.file(foto),
      );

    }

  }


  _seleccionarFoto() async {

    _procesarImagen( ImageSource.gallery );

  }
  
  
  _tomarFoto() async {

     var cam = await ImagePicker.pickImage(source: ImageSource.camera);

    if ( cam != null ) {
      producto.fotoUrl = null;
    }

    //print(foto.path);
    setState(() {
      foto = cam;
    });
  }

  _procesarImagen( ImageSource origen ) async {
    var cam = await ImagePicker.pickImage(
      source: origen
    );

    if ( cam != null ) {
      producto.fotoUrl = null;
    }

    //print(foto.path);
    setState(() {
      foto = cam;
    });
  }
}





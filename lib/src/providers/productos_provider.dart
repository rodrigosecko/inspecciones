
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:mime_type/mime_type.dart';

import 'package:formvalidation/src/models/producto_model.dart';

class ProductosProvider {

  final String _url = 'https://inspeccion-55816.firebaseio.com';
  //https://inspeccion-55816.firebaseio.com/


  Future<bool> crearProducto( ProductoModel producto ) async {
    
   /* final url = '$_url/productos.json';

    final resp = await http.post( url, body: productoModelToJson(producto) );

    final decodedData = json.decode(resp.body);

    print( decodedData );

    return true;*/

    //codigo para insertar un dato
    String _urlip='192.168.0.8';
    //String _urls='pmgm.oopp.gob.bo';
    print(producto.fotoUrl+'----'+producto.titulo);

   final urldos =Uri.http(_urlip, '/CodeigniterPMGM/Restserver/insertainspeccion/',
   {                  
                 
                 'titulo'      : producto.titulo,
                 'valor'      : producto.valor.toString(),
                 'disponible'      : producto.disponible.toString(),
                 'fotoUrl'      : producto.fotoUrl, 
                });    
       final r = await http.get(urldos);

 
    final decodeData =json.decode(r.body);
    print(decodeData['mensaje']);
    //Map dataMap = json.decode(r.body);
      //print(dataMap ['rutas']);
    return true;
    //fin del codigo

  }

  Future<bool> editarProducto( ProductoModel producto ) async {
    
    final url = '$_url/productos/${ producto.id }.json';

    final resp = await http.put( url, body: productoModelToJson(producto) );

    final decodedData = json.decode(resp.body);

    print( decodedData );

    return true;

  }



  Future<List<ProductoModel>> cargarProductos() async {

    /*final url  = '$_url/productos.json';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> productos = new List();


    if ( decodedData == null ) return [];

    decodedData.forEach( ( id, prod ){

      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;

      productos.add( prodTemp );

    });

    // print( productos[0].id );

    return productos;*/

    
    //codigo nuevo
    String _urlip='192.168.0.8';
    final urldos =Uri.http(_urlip, '/CodeigniterPMGM/Restserver/prueba/',
   {                                  
                 'id'      : '9',
                  });  
                
  final resp = await http.get(urldos);

    final decodedData = json.decode(resp.body);
    


    if ( decodedData == null ) return [];

    

      final productos = Productos.fromJsonList(decodedData['respuesta']);
    

  

    // print( productos[0].id );

    return productos.items;
    //fin de codigo nuevo 

  }


  Future<int> borrarProducto( String id ) async { 

    final url  = '$_url/productos/$id.json';
    final resp = await http.delete(url);

    print( resp.body );

    return 1;
  }


  Future<String> subirImagen( File imagen ) async {

    final url = Uri.parse('http://api.cloudinary.com/v1_1/ddcnjlkev/image/upload?upload_preset=d6v4nsmt');
    final mimeType = mime(imagen.path).split('/'); //image/jpeg



    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath(
      'file', 
      imagen.path,
      contentType: MediaType( mimeType[0], mimeType[1] )
    );

    imageUploadRequest.files.add(file);


    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if ( resp.statusCode != 200 && resp.statusCode != 201 ) {
      print('Algo salio mal');
      print( resp.body );
      return null;
    }

    final respData = json.decode(resp.body);
    print( respData);

    return respData['secure_url'];


  }


}


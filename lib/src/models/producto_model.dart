// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {

    String id;
    String propietario;
    String frente;
    String fondo;
    
    //bool disponible;    

    bool luz;
    bool agua;
    bool pluvial;
    bool sanitario;
    bool alumbrado;
    bool gas;
    bool basura;
    bool telefono;
    bool transporte;
    String fotoUrl;

    
    String estado;
    String forma;
    String calle;
    String zona;
    String numero;
    
    ProductoModel({
        this.id,
        this.propietario = '',
        this.frente  = '0.0',
        this.fondo  = '0.0',
        
        //this.disponible = true,
        this.fotoUrl,
        this.luz = true,
        this.agua = true,
        this.pluvial = true,
        this.sanitario = true,
        this.alumbrado = true,
        this.gas = true,
        this.basura = true,
        this.telefono = true,
        this.transporte = true,
        this.numero ='0',
        this.estado = 'Ninguno',
        this.forma = 'Ninguno',
        this.calle = '',
        this.zona = '',
        
    });

    factory ProductoModel.fromJson(Map<String, dynamic> json) => new ProductoModel(
        id         : json["id"],
        propietario     : json["propietario"],
        frente      : json["frente"],
        fondo      : json["fondo"],
        numero      : json["numero"],
        estado     : json["estado"],
        forma     : json["forma"],
        calle     : json["calle"],
        zona     : json["zona"],
        //disponible : true,
        luz : true,
        agua : true,
        pluvial : false,
        sanitario : true,
        alumbrado : true,
        gas : false,
        basura : true,
        telefono : false,
        transporte : true,

        fotoUrl    : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        // "id"         : id,
        "propietario"     : propietario,
        "frente"      : frente,
        "fondo"      : fondo,
        //"disponible" : disponible,
        "estado"      : estado,
        "calle"      : calle,
        "zona"      : zona,
        "numero"      : numero,
        "forma"      : forma,
        "luz" : luz,
        "agua" : agua,
        "pluvial" : pluvial,
        "sanitario" : sanitario,
        "alumbrado" : alumbrado,
        "gas" : gas,
        "basura" : basura,
        "telefono" : telefono,
        "transporte" : transporte,
        "fotoUrl"    : fotoUrl,
    };
}

class Productos {

  List<ProductoModel> items = new List();

  Productos();

  Productos.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final producto = new ProductoModel.fromJson(item);
      items.add( producto );
    }

  }

}
// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {

    String id;
    String titulo;
    double valor;
    bool disponible;    

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
    ProductoModel({
        this.id,
        this.titulo = '',
        this.valor  = 0.0,
        this.disponible = true,
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
        
    });

    factory ProductoModel.fromJson(Map<String, dynamic> json) => new ProductoModel(
        id         : json["id"],
        titulo     : json["titulo"],
        valor      : 0.0 ,
        disponible : true,
        luz : true,
        agua : true,
        pluvial : true,
        sanitario : true,
        alumbrado : true,
        gas : true,
        basura : true,
        telefono : true,
        transporte : true,

        fotoUrl    : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        // "id"         : id,
        "titulo"     : titulo,
        "valor"      : valor,
        "disponible" : disponible,
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
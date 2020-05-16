class Usuario {
    int id;
    String nombre;
    String apPaterno;
    String apMaterno;
    String edad;
    String telefono;
    String direccion;

    Usuario({
        this.id,
        this.nombre,
        this.apPaterno,
        this.apMaterno,
        this.edad,
        this.telefono,
        this.direccion,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        nombre: json["nombre"],
        apPaterno: json["ap_paterno"],
        apMaterno: json["ap_materno"],
        edad: json["edad"],
        telefono: json["telefono"],
        direccion: json["direccion"],
    );

//     Usuario.fromMap(dynamic obj) {
//     this.id = obj['id'];
//     this.nombre= obj['nombre'];
//     this.apPaterno = obj['paterno'];
//   }

//   String get nom => nombre;
//   String get paterno => apPaterno;
//   int get _id => id;

//   Map<String, dynamic> toMap() {
//     var map = new Map<String, dynamic>();
//     map["id"] = _id;
//     map["nombre"] = nombre;
//     map["Apellido paterno"] = apPaterno;
//     return map;
//   }
// }
    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "ap_paterno": apPaterno,
        "ap_materno": apMaterno,
        "edad": edad,
        "telefono": telefono,
        "direccion": direccion,
    };
}
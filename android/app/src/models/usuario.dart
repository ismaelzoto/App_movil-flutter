class Usuario {
    int id;
    String nombre;
    String apPaterno;
    String apMaterno;
    String edad;
    int telefono;
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
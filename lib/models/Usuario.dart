class Usuario {
  String usuario;
  String password;
  String correo;
  String telefono;
  String direccion;
  List<String> dispositivos;

  Usuario(
      {String usuario = "",
      String password = "",
      String correo = "",
      String telefono = "",
      String direccion = ""}) {
    this.usuario = usuario;
    this.correo = correo;
    this.password = password;
    this.telefono = telefono;
    this.direccion = direccion;
  }

  Map<String, dynamic> getMap() {
    return {
      "usuario": this.usuario,
      "password": this.password,
      "correo": this.correo,
      "telefono": this.telefono,
      "direccion": this.direccion,
    };
  }
}

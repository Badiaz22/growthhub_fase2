import 'package:fake_store_api/models/models.dart';

/// La clase [User] representa un usuario de la tienda en línea.
///
/// Un usuario tiene varios atributos como el ID, email, nombre de usuario, contraseña,
/// nombre completo, dirección y número de teléfono.
class User {
  /// Propiedad [id], que es de tipo int (entero).
  /// Representa un identificador único para cada usuario.
  /// Es 'final', lo que significa que no puede cambiar una vez asignado.
  final int id;

  /// Propiedad [email], que es de tipo String (texto).
  /// Almacena el correo electrónico del usuario.
  /// Es 'final', por lo tanto, no puede cambiar después de ser asignado.
  final String email;

  /// Propiedad [username], que es de tipo String.
  /// Representa el nombre de usuario para acceder a la cuenta.
  /// También es 'final' y no puede modificarse una vez asignado.
  final String username;

  /// Propiedad [password], que es de tipo String.
  /// Almacena la contraseña del usuario.
  /// Es 'final', por lo que no puede cambiarse una vez que se le asigna un valor.
  final String password;

  /// Propiedad [name], que es de tipo [Name].
  /// Almacena el nombre completo del usuario, que incluye el primer nombre y el apellido.
  /// Es 'final', lo que significa que no se puede modificar después de ser asignado.
  final Name name;

  /// Propiedad [address], que es de tipo [Address].
  /// Almacena la dirección del usuario, que incluye la ciudad, calle, número y código postal.
  /// Es 'final', por lo que no puede cambiar una vez asignada.
  final Address address;

  /// Propiedad [phone], que es de tipo String.
  /// Almacena el número de teléfono del usuario.
  /// Es 'final', lo que significa que no puede modificarse una vez asignado.
  final String phone;

  /// Constructor de la clase [User].
  ///
  /// Se requieren los valores para [id], [email], [username], [password], [name],
  /// [address] y [phone] cuando se crea una nueva instancia de la clase.
  const User({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });

  /// Convierte un mapa de datos en un objeto [User].
  ///
  /// Es la implementación canónica de deserialización. Utilizada directamente
  /// para datos en memoria (ej. base de datos local) y por [fromJson].
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      username: map['username'],
      password: map['password'],
      name: Name.fromMap(map['name']),
      address: Address.fromMap(map['address']),
      phone: map['phone'],
    );
  }

  /// Convierte un mapa JSON en un objeto [User].
  ///
  /// Delega a [fromMap] ya que la estructura del mapa es idéntica.
  factory User.fromJson(Map<String, dynamic> json) => User.fromMap(json);

  /// Convierte el objeto [User] en un mapa de datos.
  ///
  /// Es la implementación canónica de serialización. Utilizada directamente
  /// para datos en memoria y por [toJson].
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'name': name.toMap(),
      'address': address.toMap(),
      'phone': phone,
    };
  }

  /// Convierte el objeto [User] en un mapa JSON.
  ///
  /// Delega a [toMap] ya que la representación es idéntica.
  Map<String, dynamic> toJson() => toMap();
}

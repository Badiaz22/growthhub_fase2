import 'package:fake_store_api/models/models.dart';

/// La clase [Address] representa una dirección de un usuario.
class Address {
  /// Propiedad [city] (ciudad), que es de tipo String (texto).
  /// Es 'final', lo que significa que una vez que se le asigne un valor, no puede cambiar.
  final String city;

  /// Propiedad [street] (calle), también de tipo String (texto).
  /// Es 'final', por lo tanto, no se puede modificar una vez asignado el valor.
  final String street;

  /// Propiedad [number] (número), de tipo int (entero).
  /// Representa el número de la calle. Es 'final' y no se puede cambiar después de ser asignado.
  final int number;

  /// Propiedad [zipcode] (código postal), de tipo String.
  /// Es 'final', por lo que su valor no se puede modificar una vez que se haya establecido.
  final String zipcode;

  /// Propiedad [geolocation], de tipo [Geolocation].
  /// Almacena información de latitud y longitud de la dirección.
  /// También es 'final', por lo que es inmutable.
  final Geolocation geolocation;

  /// Constructor de la clase [Address].
  ///
  /// Todos los campos son obligatorios para garantizar que no existan
  /// instancias con datos incompletos.
  const Address({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });

  /// Convierte un mapa de datos en un objeto [Address].
  ///
  /// Es la implementación canónica de deserialización. Utilizada directamente
  /// para datos en memoria (ej. base de datos local) y por [fromJson].
  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      city: map['city'],
      street: map['street'],
      number: map['number'],
      zipcode: map['zipcode'],
      geolocation: Geolocation.fromMap(map['geolocation']),
    );
  }

  /// Convierte un mapa JSON en un objeto [Address].
  ///
  /// Delega a [fromMap] ya que la estructura del mapa es idéntica.
  factory Address.fromJson(Map<String, dynamic> json) => Address.fromMap(json);

  /// Convierte el objeto [Address] en un mapa de datos.
  ///
  /// Es la implementación canónica de serialización. Utilizada directamente
  /// para datos en memoria y por [toJson].
  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'street': street,
      'number': number,
      'zipcode': zipcode,
      'geolocation': geolocation.toMap(),
    };
  }

  /// Convierte el objeto [Address] en un mapa JSON.
  ///
  /// Delega a [toMap] ya que la representación es idéntica.
  Map<String, dynamic> toJson() => toMap();
}

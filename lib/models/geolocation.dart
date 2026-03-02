/// La clase [Geolocation] representa la ubicación geográfica de un punto.
///
/// Contiene dos propiedades:
/// - [lat]: Representa la latitud.
/// - [long]: Representa la longitud.
class Geolocation {
  /// Propiedad [lat] (latitud), que es de tipo String.
  /// Es 'final', lo que significa que no puede cambiar una vez que se le asigna un valor.
  final String lat;

  /// Propiedad [long] (longitud), también de tipo String.
  /// Es 'final', por lo tanto, no se puede modificar una vez asignado el valor.
  final String long;

  /// Constructor de la clase [Geolocation].
  ///
  /// Se requieren los valores para [lat] y [long] cuando se crea una instancia de la clase.
  const Geolocation({
    required this.lat,
    required this.long,
  });

  /// Convierte un mapa de datos en un objeto [Geolocation].
  ///
  /// Es la implementación canónica de deserialización. Utilizada directamente
  /// para datos en memoria (ej. base de datos local) y por [fromJson].
  factory Geolocation.fromMap(Map<String, dynamic> map) {
    return Geolocation(
      lat: map['lat'],
      long: map['long'],
    );
  }

  /// Convierte un mapa JSON en un objeto [Geolocation].
  ///
  /// Delega a [fromMap] ya que la estructura del mapa es idéntica.
  factory Geolocation.fromJson(Map<String, dynamic> json) =>
      Geolocation.fromMap(json);

  /// Convierte el objeto [Geolocation] en un mapa de datos.
  ///
  /// Es la implementación canónica de serialización. Utilizada directamente
  /// para datos en memoria y por [toJson].
  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'long': long,
    };
  }

  /// Convierte el objeto [Geolocation] en un mapa JSON.
  ///
  /// Delega a [toMap] ya que la representación es idéntica.
  Map<String, dynamic> toJson() => toMap();
}

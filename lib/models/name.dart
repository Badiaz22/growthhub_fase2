/// La clase [Name] representa el nombre de una persona.
///
/// Contiene dos propiedades principales:
/// - [firstname]: Representa el nombre de pila.
/// - [lastname]: Representa el apellido.
class Name {
  /// Propiedad [firstname], que almacena el nombre de la persona.
  /// Es de tipo String y es 'final', lo que significa que no puede cambiar una vez asignada.
  final String firstname;

  /// Propiedad [lastname], que almacena el apellido de la persona.
  /// Es de tipo String y es 'final', por lo tanto, no se puede modificar una vez asignada.
  final String lastname;

  /// Constructor de la clase [Name].
  ///
  /// Se requieren los valores para [firstname] (nombre) y [lastname] (apellido)
  /// cuando se crea una nueva instancia de la clase [Name].
  const Name({
    required this.firstname,
    required this.lastname,
  });

  /// Convierte un mapa de datos en un objeto [Name].
  ///
  /// Es la implementación canónica de deserialización. Utilizada directamente
  /// para datos en memoria (ej. base de datos local) y por [fromJson].
  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      firstname: map['firstname'],
      lastname: map['lastname'],
    );
  }

  /// Convierte un mapa JSON en un objeto [Name].
  ///
  /// Delega a [fromMap] ya que la estructura del mapa es idéntica.
  factory Name.fromJson(Map<String, dynamic> json) => Name.fromMap(json);

  /// Convierte el objeto [Name] en un mapa de datos.
  ///
  /// Es la implementación canónica de serialización. Utilizada directamente
  /// para datos en memoria y por [toJson].
  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
    };
  }

  /// Convierte el objeto [Name] en un mapa JSON.
  ///
  /// Delega a [toMap] ya que la representación es idéntica.
  Map<String, dynamic> toJson() => toMap();
}

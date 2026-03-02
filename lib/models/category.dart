/// La clase [Category] representa una categoría de producto.
///
/// La categoría se define principalmente por un nombre [name].
class Category {
  /// Propiedad [name], que es de tipo String (texto).
  /// Es 'final', lo que significa que una vez que se le asigne un valor, no puede cambiar.
  final String name;

  /// Constructor de la clase [Category].
  /// El valor de [name] es obligatorio debido al uso de `required`.
  const Category({
    required this.name,
  });

  /// Convierte un mapa de datos en un objeto [Category].
  ///
  /// Utilizado para datos en memoria (ej. base de datos local) donde la categoría
  /// se almacena como mapa con la clave 'name'.
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(name: map['name'] as String);
  }

  /// Convierte una cadena de texto JSON en un objeto [Category].
  ///
  /// La Fake Store API retorna las categorías como strings simples
  /// (ej. "electronics"), por lo que este método toma directamente esa cadena.
  factory Category.fromJson(String category) {
    return Category(name: category);
  }

  /// Convierte el objeto [Category] en un mapa de datos.
  ///
  /// Utilizado para datos en memoria (ej. base de datos local).
  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  /// Convierte el objeto [Category] en una cadena de texto JSON.
  ///
  /// Retorna solo el nombre porque la API representa las categorías como strings simples.
  String toJson() {
    return name;
  }
}

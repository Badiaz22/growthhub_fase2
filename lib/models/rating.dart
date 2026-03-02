/// La clase [Rating] representa la calificación de un producto en la tienda.
///
/// Contiene dos propiedades:
/// - [rate]: La puntuación promedio del producto (ej. 4.5 sobre 5).
/// - [count]: El número total de valoraciones recibidas.
class Rating {
  /// Propiedad [rate], que es de tipo double.
  /// Representa la puntuación promedio del producto.
  /// Es 'final', lo que significa que no puede cambiar una vez asignada.
  final double rate;

  /// Propiedad [count], que es de tipo int.
  /// Representa la cantidad de valoraciones que ha recibido el producto.
  /// Es 'final', por lo tanto, no se puede modificar una vez asignada.
  final int count;

  /// Constructor de la clase [Rating].
  ///
  /// Se requieren los valores para [rate] y [count] cuando se crea una instancia.
  const Rating({
    required this.rate,
    required this.count,
  });

  /// Convierte un mapa de datos en un objeto [Rating].
  ///
  /// Es la implementación canónica de deserialización. Utilizada directamente
  /// para datos en memoria (ej. base de datos local) y por [fromJson].
  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: (map['rate'] as num).toDouble(),
      count: map['count'],
    );
  }

  /// Convierte un mapa JSON en un objeto [Rating].
  ///
  /// Delega a [fromMap] ya que la estructura del mapa es idéntica.
  factory Rating.fromJson(Map<String, dynamic> json) => Rating.fromMap(json);

  /// Convierte el objeto [Rating] en un mapa de datos.
  ///
  /// Es la implementación canónica de serialización. Utilizada directamente
  /// para datos en memoria y por [toJson].
  Map<String, dynamic> toMap() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  /// Convierte el objeto [Rating] en un mapa JSON.
  ///
  /// Delega a [toMap] ya que la representación es idéntica.
  Map<String, dynamic> toJson() => toMap();
}

import 'package:fake_store_api/models/models.dart';

/// La clase [Product] representa un producto en la tienda de la Fake Api Store.
///
/// Un producto tiene varios atributos como el ID, el título, la descripción, el precio,
/// la categoría, la imagen asociada y su calificación.
class Product {
  /// Propiedad [id], que es de tipo int (entero).
  /// Representa un identificador único para cada producto.
  /// Es 'final', lo que significa que no puede cambiar una vez asignado.
  final int id;

  /// Propiedad [title], que es de tipo String (texto).
  /// Representa el nombre o título del producto.
  /// Es 'final', por lo tanto, no puede modificarse después de asignado.
  final String title;

  /// Propiedad [description], que es de tipo String.
  /// Almacena la descripción del producto, que explica detalles del mismo.
  /// También es 'final' y no puede ser cambiada una vez asignada.
  final String description;

  /// Propiedad [price], que es de tipo double (número decimal).
  /// Representa el precio del producto.
  /// Es 'final', lo que significa que no puede cambiar una vez que se le asigna un valor.
  final double price;

  /// Propiedad [category], que es de tipo String.
  /// Almacena la categoría a la que pertenece el producto.
  /// Es 'final', por lo que no se puede modificar después de ser asignada.
  final String category;

  /// Propiedad [image], que es de tipo String.
  /// Representa la URL de la imagen del producto.
  /// Es 'final' y no puede ser cambiada después de ser asignada.
  final String image;

  /// Propiedad [rating], que es de tipo [Rating].
  /// Almacena la calificación promedio del producto y la cantidad de valoraciones.
  /// Es 'final', por lo que no puede modificarse una vez asignada.
  final Rating rating;

  /// Constructor de la clase [Product].
  ///
  /// Se requieren los valores para [id], [title], [description], [price], [category],
  /// [image] y [rating] cuando se crea una nueva instancia de la clase.
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
  });

  /// Convierte un mapa de datos en un objeto [Product].
  ///
  /// Es la implementación canónica de deserialización. Utilizada directamente
  /// para datos en memoria (ej. base de datos local) y por [fromJson].
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: (map['price'] as num).toDouble(),
      category: map['category'],
      image: map['image'],
      rating: Rating.fromMap(map['rating']),
    );
  }

  /// Convierte un mapa JSON en un objeto [Product].
  ///
  /// Delega a [fromMap] ya que la estructura del mapa es idéntica.
  factory Product.fromJson(Map<String, dynamic> json) => Product.fromMap(json);

  /// Convierte el objeto [Product] en un mapa de datos.
  ///
  /// Es la implementación canónica de serialización. Utilizada directamente
  /// para datos en memoria y por [toJson].
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'image': image,
      'rating': rating.toMap(),
    };
  }

  /// Convierte el objeto [Product] en un mapa JSON.
  ///
  /// Delega a [toMap] ya que la representación es idéntica.
  Map<String, dynamic> toJson() => toMap();
}

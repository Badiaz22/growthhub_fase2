// Se importa el archivo 'models.dart', que contiene la clase [Product].
import 'package:fake_store_api/models/models.dart';

/// Función que imprime los detalles completos de cada producto.
///
/// La función toma una lista de objetos [Product] y los imprime uno por uno,
/// mostrando información detallada como el ID, el título, la descripción, el precio,
/// la categoría y la URL de la imagen del producto.
void printProducts({required List<Product> products}) {
  /// Imprime una línea separadora para mejorar la legibilidad en la consola.
  print('-----------------------------');

  /// Imprime el título 'EXTENDED PRODUCT INFORMATION' en la consola.
  print('\nEXTENDED PRODUCT INFORMATION\n');

  /// Otra línea separadora para delimitar el inicio de la lista.
  print('-----------------------------');

  // Itera sobre la lista de productos y muestra la información extendida
  for (var product in products) {
    /// Imprime el ID del producto.
    print('Id: ${product.id}');

    /// Imprime el título del producto.
    print('Product: ${product.title}');

    /// Imprime la descripción del producto.
    print('Description: ${product.description}');

    /// Imprime el precio del producto con el formato de dólares.
    print('Price: \$${product.price}');

    /// Imprime la categoría a la que pertenece el producto.
    print('Category: ${product.category}');

    /// Imprime la URL de la imagen asociada al producto.
    print('Image: ${product.image}');

    /// Imprime la calificación promedio y el número de valoraciones del producto.
    print('Rating: ${product.rating.rate} / 5 (${product.rating.count} reviews)');

    /// Imprime una línea separadora entre cada producto.
    print('-----------------------------');
  }
}

/// Función que imprime un resumen tabular de los productos.
///
/// La función toma una lista de objetos [Product] y los imprime en formato de tabla,
/// mostrando un resumen con el ID, el título, el precio, la categoría y una descripción
/// truncada si es necesario.
void printProductsTable({required List<Product> products}) {
  /// Imprime una línea separadora para mejorar la legibilidad en la consola.
  print('-----------------------------');

  /// Imprime el título 'PRODUCTS SUMMARY TABLE' en la consola.
  print('\nPRODUCTS SUMMARY TABLE\n');

  /// Otra línea separadora para delimitar el inicio de la tabla.
  print('-----------------------------');

  // Imprime las cabeceras de la tabla.
  print('|${'-' * 7}|${'-' * 31}|${'-' * 11}|${'-' * 20}|${'-' * 34}|');
  print(
      '| ID${' ' * 4}| Product${' ' * 23}| Price${' ' * 5}| Category${' ' * 11}| Description${' ' * 22}|');
  print('|${'-' * 7}|${'-' * 31}|${'-' * 11}|${'-' * 20}|${'-' * 34}|');

  // Itera sobre los productos y muestra la información en formato de tabla
  for (var product in products) {
    /// Formatea el ID del producto y lo alinea a la derecha.
    String id = product.id.toString().padRight(4);

    /// Si el título del producto es mayor a 29 caracteres, lo trunca y agrega '...'.
    /// Si no, lo alinea a la derecha con 29 caracteres.
    String title = product.title.length > 29
        ? '${product.title.substring(0, 26)}...'
        : product.title.padRight(29);

    /// Formatea el precio del producto para que siempre muestre dos decimales.
    String price = '\$${product.price.toStringAsFixed(2)}'.padRight(9);

    /// Alinea la categoría del producto a la derecha con un espacio de 18 caracteres.
    String category = product.category.padRight(18);

    /// Si la descripción del producto es mayor a 29 caracteres, la trunca y agrega '...'.
    /// Si no, la alinea a la izquierda con un espacio de 32 caracteres.
    String description = product.description.length > 29
        ? '${product.description.substring(0, 29)}...'
        : product.description.padLeft(32);

    // Imprime cada fila con los detalles del producto en formato de tabla.
    print('| $id  | $title | $price | $category | $description |');
  }

  /// Línea final de la tabla para mejorar la legibilidad.
  print('|${'-' * 7}|${'-' * 31}|${'-' * 11}|${'-' * 20}|${'-' * 34}|');
}

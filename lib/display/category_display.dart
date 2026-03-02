// Se importa el archivo 'models.dart', donde está definida la clase [Category].
import 'package:fake_store_api/models/models.dart';

/// Función que imprime la lista de categorías de productos.
///
/// La función toma una lista de objetos [Category] y los imprime en la consola
/// de manera legible.
void printCategories({required List<Category> categories}) {
  /// Imprime una línea separadora para mejorar la legibilidad en la consola.
  print('-----------------------------');

  /// Imprime el título 'CATEGORY LIST' en la consola.
  print('\nCATEGORY LIST\n');

  /// Otra línea separadora para delimitar el inicio de la lista.
  print('-----------------------------');

  // Itera sobre la lista de categorías y las imprime.
  // Por cada objeto [Category] en la lista, se imprime el nombre de la categoría.
  for (var category in categories) {
    /// Imprime cada categoría en formato "* nombre_de_categoria".
    /// El símbolo '*' se utiliza como marcador para cada categoría.
    print('* ${category.name}'); // Imprime el nombre de cada categoría.
  }

  /// Imprime una línea separadora para indicar el final de la lista.
  print('-----------------------------');
}

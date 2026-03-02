import 'package:fake_store_api/display/display.dart';
import 'package:fake_store_api/fake_store_api.dart';

void main() async {
  // Llamada a la función fetchProducts() y manejo del resultado
  final result = await fetchProducts();

  result.fold(
    (errorMessage) {
      // En caso de error
      print('Error: $errorMessage');
    },
    (products) {
      // En caso de éxito
      printProducts(products: products);
      printProductsTable(products: products);
    },
  );

  // Llamada para obtener categorías
  final categoriesResult = await fetchCategories();
  categoriesResult.fold(
    (errorMessage) {
      print('Error: $errorMessage');
    },
    (categories) {
      printCategories(categories: categories);
    },
  );

  // Llamada a la función para obtener todos los usuarios
  final usersResult = await fetchAllUsers();
  usersResult.fold(
    (errorMessage) {
      // En caso de error
      print('Error: $errorMessage');
    },
    (users) {
      // En caso de éxito, imprimir la información de cada usuario
      printUsersDetails(users: users); // Detalles extendidos
      printUsersTable(users: users); // Tabla resumen
    },
  );
}

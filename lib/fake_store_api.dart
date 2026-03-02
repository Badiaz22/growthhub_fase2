import 'dart:convert';
// Importa la biblioteca 'dart:convert', que proporciona utilidades para trabajar con JSON.

import 'package:dartz/dartz.dart';
// Importa el paquete 'dartz', que se utiliza para trabajar con tipos como 'Either'.
// 'Either' es una estructura de datos que puede contener dos valores: uno para el éxito (Right) y otro para el error (Left).

import 'package:http/http.dart' as http;
// Importa el paquete 'http', que proporciona utilidades para realizar solicitudes HTTP.

import 'package:fake_store_api/models/models.dart';
// Importa el archivo 'models.dart', que contiene las clases [Product], [Category] y [User] necesarias para mapear la respuesta de la API.

// Constantes que almacenan las URLs base de la API para productos, categorías y usuarios.
// Se usa 'const' en lugar de 'final' porque son valores conocidos en tiempo de compilación,
// lo que permite al compilador optimizarlos y evitar su recálculo en tiempo de ejecución.
/// URL base de la API Fake Store.
const String baseUrl = 'https://fakestoreapi.com';

/// URL para obtener la lista de productos.
const String getProductsUrl = '$baseUrl/products';

/// URL para obtener las categorías de productos.
const String getProductsCategoriesUrl = '$getProductsUrl/categories';

/// URL para obtener la lista de todos los usuarios.
const String getAllUserUrl = '$baseUrl/users';

/// Función que realiza una solicitud HTTP para obtener la lista de productos.
///
/// La función devuelve un objeto de tipo [Either], que puede contener un mensaje de error (Left)
/// o una lista de productos (Right) en caso de éxito.
Future<Either<String, List<Product>>> fetchProducts() async {
  try {
    // Realiza una solicitud GET a la API usando la URL de productos y espera la respuesta.
    final response = await http.get(Uri.parse(getProductsUrl));

    // Si la respuesta tiene el código de estado 200 (éxito), se procede a decodificar los datos.
    if (response.statusCode == 200) {
      // Convierte el cuerpo de la respuesta HTTP, que está en formato JSON, en una lista dinámica.
      List<dynamic> data = jsonDecode(response.body);

      // Itera sobre cada elemento de la lista dinámica, convirtiendo cada uno en un objeto [Product] mediante el método 'fromJson'.
      List<Product> products =
          data.map((product) => Product.fromJson(product)).toList();

      // Devuelve la lista de productos como resultado exitoso utilizando 'Right'.
      return Right(products);
    } else {
      // Si el código de estado no es 200, se devuelve un mensaje de error con el código de estado.
      return Left(
          'Error al obtener los productos. Código de estado: ${response.statusCode}');
    }
  } catch (e) {
    // Si ocurre un error de red o de procesamiento, lo captura y lo devuelve usando 'Left'.
    return Left('Error al realizar la solicitud de productos: $e');
  }
}

/// Función que realiza una solicitud HTTP para obtener la lista de categorías de productos.
///
/// La función devuelve un objeto [Either] que contiene un mensaje de error (Left)
/// o una lista de categorías (Right) en caso de éxito.
Future<Either<String, List<Category>>> fetchCategories() async {
  try {
    // Realiza una solicitud GET a la URL de categorías y espera la respuesta.
    final response = await http.get(Uri.parse(getProductsCategoriesUrl));

    // Si el código de estado es 200 (éxito), procesa la respuesta.
    if (response.statusCode == 200) {
      // Convierte el cuerpo de la respuesta en una lista dinámica de categorías.
      List<dynamic> data = jsonDecode(response.body);

      // Mapea cada categoría en el formato JSON a un objeto [Category] mediante 'fromJson'.
      List<Category> categories =
          data.map((category) => Category.fromJson(category)).toList();

      // Retorna la lista de categorías en caso de éxito utilizando 'Right'.
      return Right(categories);
    } else {
      // En caso de error HTTP, devuelve un mensaje de error con el código de estado.
      return Left(
          'Error al obtener las categorías. Código de estado: ${response.statusCode}');
    }
  } catch (e) {
    // Si ocurre un error de red o de procesamiento, lo captura y lo devuelve usando 'Left'.
    return Left('Error al realizar la solicitud de categorías: $e');
  }
}

/// Función que realiza una solicitud HTTP para obtener la lista de usuarios.
///
/// La función devuelve un objeto [Either] que contiene un mensaje de error (Left)
/// o una lista de usuarios (Right) en caso de éxito.
Future<Either<String, List<User>>> fetchAllUsers() async {
  try {
    // Realiza una solicitud GET a la URL y espera la respuesta.
    final response = await http.get(Uri.parse(getAllUserUrl));

    // Si la respuesta tiene un código de estado 200 (éxito), procesa los datos.
    if (response.statusCode == 200) {
      // Convierte el cuerpo de la respuesta en formato JSON a una lista dinámica.
      List<dynamic> data = jsonDecode(response.body);

      // Mapea cada usuario en el formato JSON a un objeto [User] utilizando 'fromJson'.
      List<User> users =
          data.map((userJson) => User.fromJson(userJson)).toList();

      // Retorna la lista de usuarios en caso de éxito utilizando 'Right'.
      return Right(users);
    } else {
      // Si el código de estado no es 200, devuelve un mensaje de error detallado con el código de estado.
      return Left(
          'Error al obtener los usuarios. Código de estado: ${response.statusCode}');
    }
  } catch (e) {
    // Si ocurre un error en la solicitud, lo captura y devuelve el error utilizando 'Left'.
    return Left('Error al realizar la solicitud de usuarios: $e');
  }
}

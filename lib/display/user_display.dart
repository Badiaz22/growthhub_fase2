// Se importa el archivo 'models.dart', que contiene la clase [User].
import 'package:fake_store_api/models/models.dart';

/// Función que imprime los detalles completos de cada usuario.
///
/// La función toma una lista de objetos [User] y los imprime uno por uno,
/// mostrando información detallada como el ID, nombre completo, correo electrónico,
/// nombre de usuario, contraseña (solo con fines de desarrollo), dirección y teléfono.
void printUsersDetails({required List<User> users}) {
  /// Imprime una línea separadora para mejorar la legibilidad en la consola.
  print('-----------------------------');

  /// Imprime el título 'EXTENDED USERS INFORMATION' en la consola.
  print('\nEXTENDED USERS INFORMATION\n');

  /// Otra línea separadora para delimitar el inicio de la lista.
  print('-----------------------------');

  // Itera sobre la lista de usuarios y muestra la información extendida
  for (var user in users) {
    /// Imprime el ID del usuario.
    print('ID: ${user.id}');

    /// Imprime el nombre completo del usuario, compuesto por el primer nombre y el apellido.
    print('Name: ${user.name.firstname} ${user.name.lastname}');

    /// Imprime el correo electrónico del usuario.
    print('Email: ${user.email}');

    /// Imprime el nombre de usuario utilizado para acceder a la cuenta.
    print('Username: ${user.username}');

    /// Imprime la contraseña del usuario. **Nota:** Se debe evitar imprimir contraseñas en producción.
    print('Password: ${user.password}');

    /// Imprime la dirección completa del usuario (calle y ciudad).
    print('Address: ${user.address.street}, ${user.address.city}');

    /// Imprime el código postal de la dirección del usuario.
    print('Zip Code: ${user.address.zipcode}');

    /// Imprime el número de teléfono del usuario.
    print('Phone: ${user.phone}');

    /// Imprime una línea separadora entre cada usuario.
    print('-----------------------------');
  }
}

/// Función que imprime un resumen tabular de los usuarios.
///
/// La función toma una lista de objetos [User] y los imprime en formato de tabla,
/// mostrando un resumen con el ID, nombre completo, correo electrónico, dirección y teléfono.
void printUsersTable({required List<User> users}) {
  /// Imprime una línea separadora para mejorar la legibilidad en la consola.
  print('-----------------------------');

  /// Imprime el título 'USERS SUMMARY TABLE' en la consola.
  print('\nUSERS SUMMARY TABLE\n');

  /// Otra línea separadora para delimitar el inicio de la tabla.
  print('-----------------------------');

  // Imprime las cabeceras de la tabla
  print('|${'-' * 7}|${'-' * 32}|${'-' * 26}|${'-' * 46}|${'-' * 16}|');
  print(
      '| ID${' ' * 4}| Name${' ' * 27}| Email${' ' * 20}| Address${' ' * 38}| Phone${' ' * 10}|');
  print('|${'-' * 7}|${'-' * 32}|${'-' * 26}|${'-' * 46}|${'-' * 16}|');

  // Itera sobre los usuarios y muestra los datos en formato de tabla
  for (var user in users) {
    /// Formatea el ID del usuario y lo alinea a la derecha.
    String id = user.id.toString().padRight(5);

    /// Formatea el nombre completo del usuario (nombre y apellido) y lo alinea a la derecha.
    String name = '${user.name.firstname} ${user.name.lastname}'.padRight(30);

    /// Alinea el correo electrónico del usuario con 24 caracteres.
    String email = user.email.padRight(24);

    /// Formatea y alinea la dirección del usuario (calle, ciudad y código postal) a la derecha.
    String address =
        '${user.address.street}, ${user.address.city}, ${user.address.zipcode}'
            .padRight(44);

    /// Alinea el número de teléfono del usuario con 14 caracteres.
    String phone = user.phone.padRight(14);

    // Imprime cada fila de la tabla con los datos del usuario.
    print('| $id | $name | $email | $address | $phone |');
  }

  /// Imprime una línea final de la tabla para mejorar la legibilidad.
  print('|${'-' * 7}|${'-' * 32}|${'-' * 26}|${'-' * 46}|${'-' * 16}|');
}

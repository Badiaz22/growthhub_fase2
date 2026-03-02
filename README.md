# Fake Store API - Etapa 2 Reto Growth Hub

Una aplicación de consola desarrollada en **Dart** que consume la [Fake Store API](https://fakestoreapi.com/), implementando modelos de datos inmutables y el tipo `Either` de la biblioteca `dartz` para el manejo funcional de errores.

---

## Descripción General

Este proyecto demuestra habilidades fundamentales en Dart incluyendo:
- Consumo de APIs externas mediante solicitudes HTTP
- Modelado de datos con inmutabilidad garantizada mediante constructores `const`
- Manejo de errores funcional usando `Either` de la biblioteca `dartz`
- Presentación de datos en múltiples formatos (detallado y tabla)

La aplicación interactúa con **3 endpoints** de la Fake Store API:

| Endpoint | Descripción |
|---|---|
| `GET /products` | Lista completa de productos |
| `GET /products/categories` | Categorías disponibles |
| `GET /users` | Información de todos los usuarios |

---

## Estructura del Proyecto

```
fake_store_api/
├── bin/
│   └── main.dart                        Punto de entrada
├── lib/
│   ├── fake_store_api.dart              Funciones de consumo de la API
│   ├── models/
│   │   ├── models.dart                  Barrel de exportaciones
│   │   ├── product.dart                 Modelo Product + Rating
│   │   ├── rating.dart                  Modelo Rating
│   │   ├── category.dart                Modelo Category
│   │   ├── user.dart                    Modelo User
│   │   ├── name.dart                    Modelo Name
│   │   ├── address.dart                 Modelo Address
│   │   └── geolocation.dart             Modelo Geolocation
│   └── display/
│       ├── display.dart                 Barrel de exportaciones
│       ├── product_display.dart         Vistas de productos
│       ├── category_display.dart        Vista de categorías
│       └── user_display.dart            Vistas de usuarios
├── test/
│   └── fake_store_api_test.dart
├── pubspec.yaml
└── analysis_options.yaml
```

### Decisiones de diseño

La estructura sigue las convenciones de Dart:

- **`models/`** — DTOs que representan la respuesta de la API. 
- **`display/`** — Funciones de presentación en consola. 
- **`fake_store_api.dart`** — Archivo principal de la librería. Coincide con el nombre del paquete y actúa como punto de entrada al servicio HTTP.
- **Barrel files** (`models.dart`, `display.dart`) — Centralizan las exportaciones para evitar importaciones múltiples en los archivos consumidores.

---

## Modelos de Datos

Todos los modelos son **completamente inmutables**: propiedades `final` y constructores `const`.

### Product

```dart
class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final Rating rating;       // modelo anidado
}
```

### Rating

```dart
class Rating {
  final double rate;   // puntuación promedio (ej. 4.5)
  final int count;     // número de valoraciones
}
```

### Category

```dart
class Category {
  final String name;
}
```

> La API retorna las categorías como strings simples (`["electronics", "jewelery", ...]`).
> Se envuelven en un modelo `Category` para mantener consistencia y extensibilidad.

### User

```dart
class User {
  final int id;
  final String email;
  final String username;
  final String password;
  final Name name;          // modelo anidado
  final Address address;    // modelo anidado
  final String phone;
}
```

### Modelos anidados

```dart
class Name {
  final String firstname;
  final String lastname;
}

class Address {
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final Geolocation geolocation;  // modelo anidado
}

class Geolocation {
  final String lat;
  final String long;
}
```

---

## Serialización y Deserialización

Para evitar duplicación de código, `fromJson` delega a `fromMap` y `toJson` delega a `toMap`, ya que la estructura del mapa es idéntica en ambos casos:

```dart

factory Product.fromMap(Map<String, dynamic> map) {
  return Product(
    id: map['id'],
    title: map['title'],
    price: (map['price'] as num).toDouble(),
    rating: Rating.fromMap(map['rating']),
    // ...
  );
}

// fromJson delega a fromMap
factory Product.fromJson(Map<String, dynamic> json) => Product.fromMap(json);


Map<String, dynamic> toMap() {
  return {
    'id': id,
    'title': title,
    'price': price,
    'rating': rating.toMap(),
    // ...
  };
}

// toJson delega a toMap
Map<String, dynamic> toJson() => toMap();
```

> **Excepción — `Category`:** La API retorna las categorías como strings simples, por lo que
> `fromJson` recibe un `String` y `toJson` retorna un `String`. El par `fromMap` / `toMap`
> opera con `Map<String, dynamic>` para casos de almacenamiento local.

---

## Consumo de la API y Control de Errores con Either

Todas las funciones de consumo retornan `Either<String, T>`:

- **`Left<String>`** — contiene el mensaje de error
- **`Right<T>`** — contiene los datos en caso de éxito

Cada función aplica `try/catch` para capturar tanto errores HTTP (código de estado != 200) como errores de red o procesamiento (excepciones).

```dart
Future<Either<String, List<Product>>> fetchProducts() async {
  try {
    final response = await http.get(Uri.parse(getProductsUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Product> products =
          data.map((product) => Product.fromJson(product)).toList();
      return Right(products);
    } else {
      return Left(
          'Error al obtener los productos. Código de estado: ${response.statusCode}');
    }
  } catch (e) {
    return Left('Error al realizar la solicitud de productos: $e');
  }
}
```

El resultado se consume con `fold()`:

```dart
final result = await fetchProducts();

result.fold(
  (error) => print('Error: $error'),      // Left: error capturado
  (products) => printProducts(products),  // Right: datos válidos
);
```

## Dependencias

| Paquete | Versión | Propósito |
|---|---|---|
| `http` | ^1.2.2 | Solicitudes HTTP |
| `dartz` | ^0.10.1 | Tipo `Either` para control de errores |
| `lints` | ^4.0.0 | Análisis estático (dev) |
| `test` | ^1.24.0 | Framework de pruebas (dev) |

---

## Instalación y Uso

**Requisitos:** Dart SDK 3.11.0 o superior.

```bash
# 1. Clonar el repositorio
git clone https://github.com/Badiaz22/growthhub_fase2.git
cd fake_store_api

# 2. Instalar dependencias
dart pub get

# 3. Ejecutar
dart run bin/main.dart
```

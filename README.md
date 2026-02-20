# 📦 Fake Store API - Etapa 2 Reto Growth Hub

Una aplicación de consola robusta desarrollada en **Dart** que consume la [Fake Store API](https://fakestoreapi.com/) de manera eficiente, implementando patrones modernos como `Either` para el manejo de errores y modelos de datos inmutables.

---

## 🎯 Descripción General

Este proyecto demuestra habilidades fundamentales en Dart incluyendo:
- ✅ **Consumo de APIs externas** mediante solicitudes HTTP
- ✅ **Modelado de datos robusto** con inmutabilidad garantizada
- ✅ **Manejo de errores funcional** usando la biblioteca `dartz`
- ✅ **Presentación de datos** en múltiples formatos (detallado y tabla)

La aplicación interactúa con **3 endpoints diferentes** de la Fake Store API:
- `GET /products` - Lista de productos
- `GET /products/categories` - Categorías disponibles
- `GET /users` - Información de usuarios

---

## 🎨 Características Principales

### 1. **Consumo de Múltiples Endpoints**
   - Obtiene productos con detalles completos (título, descripción, precio, categoría, imagen)
   - Recupera categorías de productos disponibles
   - Accede a información completa de usuarios (nombre, dirección, contacto)

### 2. **Modelos de Datos con Inmutabilidad**
   - Todas las propiedades son `final` (garantiza inmutabilidad)
   - Constructores `const` para optimización
   - Métodos `fromJson()` para deserialización
   - Métodos `toMap()` para serialización

### 3. **Manejo de Errores Robusto**
   - Implementación de `Either<String, T>` para control funcional de errores
   - Patrón `fold()` para manejar casos exitosos y fallidos
   - Try-catch adicional para excepciones inesperadas
   - Mensajes de error descriptivos

### 4. **Presentación Flexible de Datos**
   - Vistas detalladas con información completa
   - Tablas formateadas para análisis rápido
   - Separadores visuales clara
   - Moneda formateada (\$) para precios

---

## 🏗️ Arquitectura y Decisiones de Diseño

### Separación de Responsabilidades

```
lib/
├── fake_store_api.dart       ← Lógica de conectividad API
├── classes/                  ← Modelos de datos
│   ├── product.dart
│   ├── category.dart
│   ├── user.dart
│   ├── address.dart
│   ├── name.dart
│   └── geolocation.dart
└── print_functions/          ← Presentación de datos
    ├── print_products.dart
    ├── print_categories.dart
    └── print_users.dart
```

### Patrón Either para Errores

En lugar de lanzar excepciones, usamos `Either<Error, Success>`:

```dart
// ❌ Enfoque tradicional (menos seguro)
List<Product> products = await fetchProducts(); // ¿Qué pasa si falla?

// ✅ Enfoque funcional con Either (más seguro)
Either<String, List<Product>> result = await fetchProducts();
result.fold(
  (error) => print('Error: $error'),        // Lado izquierdo: error
  (products) => print('Éxito: $products'),  // Lado derecho: datos
);
```

### Inmutabilidad en Modelos

```dart
class Product {
  final int id;              // ← final = no puede cambiar
  final String title;
  final double price;
  
  const Product({...});      // ← const = optimizado
}
```

---

## 📊 Modelos de Datos

### **Product**
```dart
Product {
  final int id
  final String title
  final String description
  final double price
  final String category
  final String image
}
```

### **Category**
```dart
Category {
  final int id
  final String name
}
```

### **User**
```dart
User {
  final int id
  final String email
  final String username
  final String password
  final Name name              // objeto anidado
  final Address address         // objeto anidado
  final String phone
}
```

### **Modelos Anidados**
- **Name**: `firstname`, `lastname`
- **Address**: `street`, `city`, `zipcode`, `geolocation`
- **Geolocation**: `lat`, `long`

---

## 📦 Dependencias

| Paquete | Versión | Propósito |
|---------|---------|-----------|
| **http** | ^1.2.2 | Solicitudes HTTP |
| **dartz** | ^0.10.1 | Tipo `Either` para control de errores |
| **test** | ^1.24.0 | Framework de pruebas (dev) |
| **lints** | ^4.0.0 | Análisis de código (dev) |

---

## 🚀 Instalación y Uso

### Requisitos Previos
- **Dart SDK**: 3.11.0 o superior
- **Git** (opcional, para clonar)

### Pasos de Instalación

1. **Clonar o descargar el proyecto**
   ```bash
   git clone https://github.com/Badiaz22/growthhub_fase2.git
   cd fake_store_api
   ```

2. **Obtener dependencias**
   ```bash
   dart pub get
   ```

3. **Ejecutar la aplicación**
   ```bash
   dart run bin/main.dart
   ```
   
   O desde la carpeta `bin/`:
   ```bash
   cd bin
   dart run main.dart
   ```

### Salida Esperada

La aplicación generará:
- Información extendida de todos los productos
- Tabla resumen de productos
- Lista de categorías disponibles
- Información detallada de todos los usuarios
- Tabla resumen de usuarios

---

## 💻 Ejemplos de Uso

### Obtener Productos
```dart
import 'package:fake_store_api/fake_store_api.dart' as api;

final result = await api.fetchProducts();
result.fold(
  (error) => print('Error: $error'),
  (products) {
    for (var product in products) {
      print('${product.title}: \$${product.price}');
    }
  },
);
```

### Obtener Categorías
```dart
final categoriesResult = await api.fetchCategories();
categoriesResult.fold(
  (error) => print('Error: $error'),
  (categories) => categories.forEach((cat) => print(cat.name)),
);
```

### Obtener Usuarios
```dart
final usersResult = await api.fetchAllUsers();
usersResult.fold(
  (error) => print('Error: $error'),
  (users) {
    for (var user in users) {
      print('${user.name.firstname} ${user.name.lastname}');
    }
  },
);
```

---

## 🔧 Estructura de Archivos

```
fake_store_api/
├── lib/
│   ├── fake_store_api.dart              (Funciones principales de API)
│   ├── classes/
│   │   ├── classes.dart                 (Exportaciones centralizadas)
│   │   ├── address.dart                 (Modelos Address, Geolocation)
│   │   ├── category.dart                (Modelo Category)
│   │   ├── name.dart                    (Modelo Name)
│   │   ├── product.dart                 (Modelo Product)
│   │   └── user.dart                    (Modelo User)
│   └── print_functions/
│       ├── print_functions.dart         (Exportaciones)
│       ├── print_categories.dart        (Funciones de impresión)
│       ├── print_products.dart          (2 vistas: detallada + tabla)
│       └── print_users.dart             (2 vistas: detallada + tabla)
├── bin/
│   └── main.dart                        (Punto de entrada)
├── test/
│   └── fake_store_api_test.dart         (Pruebas unitarias)
├── pubspec.yaml                         (Configuración del proyecto)
├── analysis_options.yaml                (Configuración de análisis)
└── README.md                            (Este archivo)
```

---

## 🎓 Conceptos Implementados

### 1. **Either: Manejo Funcional de Errores**

El tipo `Either` representa una bifurcación en el comportamiento:
```dart
Either<Left, Right>
       ↓      ↓
    Error   Datos
```

**Ventajas:**
- ✅ Manejo explícito de errores
- ✅ Código más legible
- ✅ Previene null reference exception

### 2. **Inmutabilidad**

Usar `final` en todas las propiedades previene:
- Mutaciones accidentales
- Bugs impredecibles
- Mejora en optimizaciones del compilador

### 3. **Serialización JSON**

```dart
// Convertir JSON a Dart
Product.fromJson(jsonMap) → Product

// Convertir Dart a mapa
product.toMap() → Map<String, dynamic>
```

### 4. **Separación de Capas**

- **API Layer** (`fake_store_api.dart`): Conectividad
- **Model Layer** (`classes/`): Estructura de datos
- **Presentation Layer** (`print_functions/`): Salida

---

## 🧪 Pruebas

Para ejecutar las pruebas incluidas:

```bash
dart test
```
---
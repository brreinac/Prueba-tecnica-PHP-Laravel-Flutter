📌 Prueba Técnica – To-Do List (Laravel + Flutter)

Este proyecto consiste en una aplicación To-Do List con autenticación básica, persistencia de datos y una interfaz móvil desarrollada en Flutter.
El backend se construyó con Laravel y expone una API RESTful protegida con Laravel Sanctum para el manejo de sesiones seguras.

📂 Estructura del Proyecto
/todo-app
│
├── backend-laravel/      # API construida con Laravel
│   ├── app/
│   ├── database/
│   ├── routes/api.php
│   ├── composer.json
│   └── ...
│
├── frontend-flutter/      # App móvil construida con Flutter
│   ├── lib/
│   │   ├── main.dart
│   │   ├── providers/
│   │   ├── screens/
│   │   └── services/
│   ├── pubspec.yaml
│   └── ...
│
└── README.md              # Este archivo

⚙️ Backend – Laravel
🚀 Requisitos previos

PHP >= 8.1

Composer

MySQL o PostgreSQL

Node.js y NPM (para compilar assets opcionales)

📥 Instalación
cd backend-laravel
composer install
cp .env.example .env
php artisan key:generate

⚡ Configuración de Base de Datos

Edita el archivo .env y actualiza las credenciales:

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=todo_db
DB_USERNAME=root
DB_PASSWORD=


Ejecuta migraciones:

php artisan migrate

🔐 Autenticación con Sanctum

Instala y configura Sanctum:

php artisan vendor:publish --provider="Laravel\Sanctum\SanctumServiceProvider"
php artisan migrate


Middleware habilitado en app/Http/Kernel.php:

'api' => [
    \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class,
    'throttle:api',
    \Illuminate\Routing\Middleware\SubstituteBindings::class,
],

▶️ Levantar el servidor
php artisan serve


La API estará disponible en:
👉 http://127.0.0.1:8000/api

📱 Frontend – Flutter
🚀 Requisitos previos

Flutter SDK >= 3.x

Android Studio o VS Code

Dispositivo/emulador Android o iOS

📥 Instalación
cd frontend-flutter
flutter pub get

🔗 Configuración de la API

En lib/services/api_service.dart ajusta la URL base según tu backend:

class ApiService {
  static const String baseUrl = "http://127.0.0.1:8000/api";
}


Si usas un emulador Android, usa:
👉 http://10.0.2.2:8000/api

▶️ Ejecutar la app
flutter run

✨ Funcionalidades
Backend (Laravel)

✅ Registro de usuario

✅ Login con token (Sanctum)

✅ CRUD completo de tareas (crear, listar, editar, eliminar)

✅ Validaciones y manejo de errores

✅ Migraciones y seeders iniciales

Frontend (Flutter)

✅ Pantalla de Login y Registro

✅ Pantalla de Listado de Tareas

✅ Funcionalidad de Agregar, Editar y Eliminar tareas

✅ Manejo de estado con Provider

✅ Consumo de API con http package

✅ UI responsiva y simple

📸 Evidencias

Capturas de pantalla del login, registro y lista de tareas (opcional)

Video corto mostrando flujo completo (opcional)

🏗️ Arquitectura y Buenas Prácticas
Laravel

Controladores RESTful (AuthController, TaskController)

Modelos y migraciones (User, Task)

Uso de Sanctum para proteger rutas

Rutas agrupadas en routes/api.php

Flutter

Organización por screens, providers y services

Manejo de estado con Provider

Separación de lógica de negocio y UI

Código documentado y limpio

👨‍💻 Autor

Proyecto desarrollado como parte de una Prueba Técnica – Laravel + Flutter.
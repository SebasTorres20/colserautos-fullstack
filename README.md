# 🚗 Sistema de Gestión de Ventas - Colserautos

Este proyecto es una aplicación Fullstack desarrollada como prueba técnica, diseñada para gestionar el flujo de ventas, inventario de productos y registro de vendedores para **Colserautos**.

## 🚀 Tecnologías Utilizadas

### Frontend

- **Angular 17+**: Framework principal.
- **Bootstrap & Bootstrap Icons**: Para un diseño responsivo y profesional.
- **TypeScript**: Tipado estricto para mayor robustez.

### Backend

- **Node.js & Express**: API RESTful.
- **PostgreSQL**: Motor de base de datos relacional.
- **pg (node-postgres)**: Cliente para la conexión con PostgreSQL.

---

## 🛠️ Estructura del Proyecto

- `/frontend`: Aplicación cliente en Angular.
- `/backend`: Servidor API en Node.js.
- `database.sql`: Script de creación de tablas y datos iniciales para PostgreSQL.

---

## 📦 Instalación y Configuración

### 1. Requisitos previos

- Node.js (versión 18 o superior).
- PostgreSQL instalado y en ejecución.

### 2. Configurar el Backend

1. Navega a la carpeta: `cd backend`
2. Instala las dependencias: `npm install`
3. Configura tu conexión en el archivo de configuración o `.env`:
   ```javascript
   // Ejemplo de configuración en PostgreSQL
   const pool = new Pool({
     user: "tu_usuario_postgres",
     host: "localhost",
     database: "colserautos_db",
     password: "tu_password",
     port: 5432,
   });
   ```
   Inicia el servidor: npm start o node index.js

### 3. Configurar el frontend

Navega a la carpeta: cd frontend

Instala las dependencias: npm install

Inicia la aplicación: ng serve

Abre tu navegador en: http://localhost:4200

✨ Funcionalidades Principales
Módulo de Ventas: Registro de transacciones vinculando vendedores y productos con cálculo automático de totales.

Gestión de Inventario: CRUD completo (Crear, Leer, Actualizar, Eliminar) de productos con alertas visuales de stock bajo.

Gestión de Vendedores: Registro y edición de personal de ventas.

Interfaz Corporativa: Diseño personalizado utilizando los colores institucionales de Colserautos (Azul oscuro y Rojo).

✒️ Autor
Tu Nombre - SebasTorres20

Proyecto desarrollado para fines de evaluación técnica.

// 1. Cargar variables de entorno
require('dotenv').config();

const express = require('express');
const cors = require('cors');

// 2. Importar la conexión a la base de datos (para probarla al iniciar)
const pool = require('./src/config/db');

const app = express();

// 3. Middlewares globales
app.use(cors()); // Importante para que Angular pueda conectarse
app.use(express.json()); // Para poder leer los req.body que enviamos

// 4. Importar y usar las Rutas
const vendedorRoutes = require('./src/routes/vendedorRoutes');
const productoRoutes = require('./src/routes/productoRoutes');
const ventaRoutes = require('./src/routes/ventaRoutes');

app.use('/api/vendedores', vendedorRoutes);
app.use('/api/productos', productoRoutes);
app.use('/api/ventas', ventaRoutes);

// 5. Configurar el puerto y encender el servidor
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`🚀 Servidor funcionando en http://localhost:${PORT}`);
    
    // Verificación rápida de conexión a la BD
    pool.query('SELECT NOW()', (err, res) => {
        if (err) {
            console.error('❌ Error de conexión a Postgres:', err.message);
        } else {
            console.log('✅ Conectado a PostgreSQL exitosamente');
        }
    });
});
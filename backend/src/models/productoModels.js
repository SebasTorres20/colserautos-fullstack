const pool = require('../config/db');

const Producto = {
    getAll: async () => {
        const result = await pool.query('SELECT * FROM Producto ORDER BY id_producto ASC');
        return result.rows;
    },
    getById: async (id) => {
        const result = await pool.query('SELECT * FROM Producto WHERE id_producto = $1', [id]);
        return result.rows[0];
    },
    create: async (datos) => {
        const { nombre, precio, stock } = datos;
        const result = await pool.query(
            'INSERT INTO Producto (nombre, precio, stock) VALUES ($1, $2, $3) RETURNING *',
            [nombre, precio, stock]
        );
        return result.rows[0];
    },
    update: async (id, datos) => {
        const { nombre, precio, stock } = datos;
        const result = await pool.query(
            'UPDATE Producto SET nombre = $1, precio = $2, stock = $3 WHERE id_producto = $4 RETURNING *',
            [nombre, precio, stock, id]
        );
        return result.rows[0];
    },
    delete: async (id) => {
        return await pool.query('DELETE FROM Producto WHERE id_producto = $1', [id]);
    }
};

module.exports = Producto;
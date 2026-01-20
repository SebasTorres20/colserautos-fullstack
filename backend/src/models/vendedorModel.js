const pool = require('../config/db');

const Vendedor = {
    getAll: async () => {
        const result = await pool.query('SELECT * FROM Vendedor ORDER BY nombre ASC');
        return result.rows;
    },
    getByCedula: async (cedula) => {
        const result = await pool.query('SELECT * FROM Vendedor WHERE cedula = $1', [cedula]);
        return result.rows[0];
    },
    create: async (datos) => {
        const { cedula, nombre, correo, telefono } = datos;
        const result = await pool.query(
            'INSERT INTO Vendedor (cedula, nombre, correo, telefono) VALUES ($1, $2, $3, $4) RETURNING *',
            [cedula, nombre, correo, telefono]
        );
        return result.rows[0];
    },
    update: async (cedula, datos) => {
        const { nombre, correo, telefono } = datos;
        const result = await pool.query(
            'UPDATE Vendedor SET nombre = $1, correo = $2, telefono = $3 WHERE cedula = $4 RETURNING *',
            [nombre, correo, telefono, cedula]
        );
        return result.rows[0];
    },
    delete: async (cedula) => {
        await pool.query('DELETE FROM Vendedor WHERE cedula = $1', [cedula]);
        return { message: "Eliminado" };
    }
};

module.exports = Vendedor;
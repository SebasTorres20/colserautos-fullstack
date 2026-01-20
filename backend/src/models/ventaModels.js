const pool = require('../config/db');

const Venta = {
    getAll: async () => {
        const query = `
            SELECT v.id_venta, v.fecha, v.cantidad, v.valor_total, 
                   ven.nombre as nombre_vendedor, 
                   pro.nombre as nombre_producto
            FROM Venta v
            LEFT JOIN Vendedor ven ON v.cedula_vendedor = ven.cedula
            INNER JOIN Producto pro ON v.id_producto = pro.id_producto
            ORDER BY v.fecha DESC`;
        const result = await pool.query(query);
        return result.rows;
    },
    create: async (cedula_vendedor, id_producto, cantidad, valor_total) => {
        const query = `
            INSERT INTO Venta (cedula_vendedor, id_producto, cantidad, valor_total) 
            VALUES ($1, $2, $3, $4) RETURNING *`;
        const result = await pool.query(query, [cedula_vendedor, id_producto, cantidad, valor_total]);
        return result.rows[0];
    }
};

module.exports = Venta;
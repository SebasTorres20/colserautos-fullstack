const Venta = require('../models/ventaModels');
const Producto = require('../models/productoModels');
exports.getVentas = async (req, res) => {
    try {
        const ventas = await Venta.getAll();
        res.json(ventas);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.createVenta = async (req, res) => {
    const { cedula_vendedor, id_producto, cantidad } = req.body;
    try {
        // Buscamos el producto usando su modelo para obtener el precio
        const producto = await Producto.getById(id_producto);
        if (!producto) return res.status(404).json({ error: "Producto no encontrado" });

        const valor_total = producto.precio * cantidad;

        // Guardamos la venta usando el modelo de Venta
        const nuevaVenta = await Venta.create(cedula_vendedor, id_producto, cantidad, valor_total);
        res.status(201).json(nuevaVenta);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};
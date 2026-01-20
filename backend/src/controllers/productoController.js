const Producto = require('../models/productoModels');

// 1. Obtener todos los productos
exports.getProductos = async (req, res) => {
    try {
        const productos = await Producto.getAll();
        res.json(productos);
    } catch (err) {
        res.status(500).json({ 
            error: "Error al obtener productos: " + err.message 
        });
    }
};

// 2. Crear un nuevo producto
exports.createProducto = async (req, res) => {
    try {
        // req.body debe contener { nombre, precio, stock }
        const nuevoProducto = await Producto.create(req.body);
        res.status(201).json(nuevoProducto);
    } catch (err) {
        res.status(400).json({ 
            error: "Error al crear el producto: " + err.message 
        });
    }
};

// 3. Actualizar un producto existente
exports.updateProducto = async (req, res) => {
    try {
        const { id } = req.params; // ID que viene en la URL
        const productoActualizado = await Producto.update(id, req.body);
        
        if (!productoActualizado) {
            return res.status(404).json({ error: "Producto no encontrado" });
        }
        
        res.json(productoActualizado);
    } catch (err) {
        res.status(500).json({ 
            error: "Error al actualizar el producto: " + err.message 
        });
    }
};

// 4. Eliminar un producto
exports.deleteProducto = async (req, res) => {
    try {
        const { id } = req.params;
        await Producto.delete(id);
        
        res.json({ message: "Producto eliminado correctamente" });
    } catch (err) {
        // Este catch capturará si el producto no se puede borrar 
        // por estar amarrado a una venta (ON DELETE RESTRICT)
        res.status(500).json({ 
            error: "No se puede eliminar: el producto está asociado a una venta existente." 
        });
    }
};
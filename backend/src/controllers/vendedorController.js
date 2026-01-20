const Vendedor = require('../models/vendedorModel');

exports.getVendedores = async (req, res) => {
    try {
        const vendedores = await Vendedor.getAll();
        res.json(vendedores);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.createVendedor = async (req, res) => {
    try {
        const nuevoVendedor = await Vendedor.create(req.body);
        res.status(201).json(nuevoVendedor);
    } catch (err) {
        res.status(400).json({ error: "Error al crear: " + err.message });
    }
};
// Actualizar un vendedor existente
exports.updateVendedor = async (req, res) => {
    try {
        const { cedula } = req.params; // Extraemos la cédula de la URL
        const vendedorActualizado = await Vendedor.update(cedula, req.body);
        
        if (!vendedorActualizado) {
            return res.status(404).json({ error: "Vendedor no encontrado" });
        }
        
        res.json(vendedorActualizado);
    } catch (err) {
        res.status(500).json({ error: "Error al actualizar: " + err.message });
    }
};

// Eliminar un vendedor
exports.deleteVendedor = async (req, res) => {
    try {
        const { cedula } = req.params;
        const resultado = await Vendedor.delete(cedula);
        
        res.json({ message: "Vendedor eliminado correctamente" });
    } catch (err) {
        // Manejo de error por integridad referencial (si el vendedor tiene ventas)
        res.status(500).json({ 
            error: "No se puede eliminar el vendedor porque tiene ventas asociadas." 
        });
    }
};
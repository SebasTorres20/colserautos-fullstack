const express = require('express');
const router = express.Router();
const vendedorController = require('../controllers/vendedorController');

router.get('/', vendedorController.getVendedores);
router.post('/', vendedorController.createVendedor);
// Aquí agregarías router.put('/:cedula', ...) y router.delete('/:cedula', ...)

module.exports = router;
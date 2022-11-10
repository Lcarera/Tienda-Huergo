package com.huergo.compra

import grails.transaction.Transactional
import com.huergo.AccessRulesService
import com.huergo.producto.ProductoService
import com.huergo.compra.Compra

@Transactional
class CompraService {

    AccessRulesService accessRulesService
    def productoService

    def hacerCompra( String nombreApellido, String direccion, String codigoPostal, String ciudad, String departamento) {
        
        Compra nuevaCompra = new Compra();
        
        nuevaCompra.nomreContacto = nombreApellido
        nuevaCompra.tieneEnvio = true
        nuevaCompra.calle = direccion
        nuevaCompra.departamento = departamento
        nuevaCompra.codigoPostal = codigoPostal
        nuevaCompra.ciudad = ciudad
        nuevaCompra.usuario = accessRulesService.currentUser

        def carrito = productoService.getCarrito(accessRulesService.currentUser)
        for (producto in carrito.productosVenta) {
            nuevaCompra.addToProductosVenta(producto)
        }

        nuevaCompra.save(flush:true, failOnError:true)
        vaciarCarrito(carrito)


    }

    def vaciarCarrito(Carrito carrito) {
        for (prod in carrito.productosVenta) {
            prod.carrito = null
        }
        carrito.productosVenta.clear()
        carrito.save(flush:true, failOnError:true)
    }
}
package com.huergo.compra

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils

import com.huergo.producto.ProductoService
import com.huergo.AccessRulesService

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class CheckoutController {

    def compraService
    def productoService
    def accessRulesService

    def index() {
        def carrito = productoService.getCarrito(accessRulesService.currentUser)
        def total = 0
        def cantidad = 0
        for (prod in carrito.productosVenta) {
            cantidad += 1
            total += prod.cantidad * prod.producto.precio
        }
        [cantidad:cantidad, total:total]
    }

    def show() {
    
    }

    def save() {
    
    }

    def delete() {
    
    }

    def hacerCompra( String nombreApellido, String direccion, String codigoPostal, String ciudad, String departamento) {
        def resultado = [:]
		try {
			compraService.hacerCompra(nombreApellido, direccion, codigoPostal, ciudad, departamento)
			resultado.error = false
		}
		catch(Exception e) {
			log.error(e.message)
			println e.stackTrace?.findAll{it.toString()?.with{contains(".groovy:") && ! toLowerCase().with{contains("transaction") || contains("springsecurity")}}}?.join("\n")
			resultado.error = true
		}
		finally{
			render resultado as JSON
		}
    }

}
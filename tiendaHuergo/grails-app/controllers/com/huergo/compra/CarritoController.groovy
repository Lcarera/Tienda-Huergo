package com.huergo.compra

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils

import com.huergo.producto.ProductoService
import com.huergo.AccessRulesService
@Secured(['ROLE_ADMIN','ROLE_USER'])
class CarritoController {

    AccessRulesService accessRulesService
    def productoService

    def index() {
        def carrito = productoService.getCarrito(accessRulesService.currentUser)
        [carrito:carrito]
    }

    def show() {
    
    }

    def save() {
    
    }

    def delete() {
    
    }

    def ajaxCambiarTalle(Long productoVentaId, String talle) {
        def resultado = [:]
		try {
			productoService.cambiarTalle(productoVentaId, talle)
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
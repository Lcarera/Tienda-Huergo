package com.huergo.catalogo

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils

import com.huergo.producto.ProductoService

import com.huergo.AccessRulesService
@Secured(['ROLE_ADMIN','ROLE_USER'])
class CatalogoController {

    AccessRulesService accessRulesService
    ProductoService productoService
    
    def index() {
        def prods = productoService.getProductos()
        [productos:productoService.getProductos() ]
    }

    def show() {
    
    }

    def save() {
    
    }

    def delete() {
    
    }

    def ajaxAgregarCarrito(Long productoId){
        def resultado = [:]
		try {
            def username = accessRulesService.currentUser
			productoService.agregarACarrito(productoId, username)
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
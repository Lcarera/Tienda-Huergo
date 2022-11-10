package com.huergo.compra

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class CheckoutController {

    def compraService

    def index() {
    
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
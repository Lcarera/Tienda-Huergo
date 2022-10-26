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

}
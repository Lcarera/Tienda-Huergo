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

}
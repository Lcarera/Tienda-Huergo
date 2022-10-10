package com.huergo.producto

import grails.transaction.Transactional

@Transactional
class ProductoService {
    def getProductos(){
        return Producto.list()
    }
}
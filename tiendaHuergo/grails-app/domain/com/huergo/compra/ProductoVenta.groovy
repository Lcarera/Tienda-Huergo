package com.huergo.compra

import org.joda.time.LocalDateTime
import com.huergo.producto.Producto

class ProductoVenta {

    Producto producto
    LocalDateTime fechaAgregado
    Long cantidad = 1

    static belongsTo = [carrito:Carrito, compra:Compra]

    static constraints = {
        producto nullable:false
        fechaAgregado nullable:false
        carrito nullable:true
        compra nullable:true
    }

}
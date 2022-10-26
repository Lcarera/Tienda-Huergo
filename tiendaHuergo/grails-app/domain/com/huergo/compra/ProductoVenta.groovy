package com.huergo.compra

import org.joda.time.LocalDateTime
import com.huergo.producto.Producto

class ProductoVenta {

    Producto producto
    LocalDateTime fechaAgregado

    static belongsTo = [carrito:Carrito]

    static constraints = {
        producto nullable:false
        fechaAgregado nullable:false
        carrito nullable:false
    }

}
package com.huergo.compra

import org.joda.time.LocalDateTime
import com.huergo.producto.Producto

class ProductoVenta {

    Producto producto
    LocalDateTime fechaAgregado
    LocalDateTime fechaComprado

    static belongsTo = [carrito:Carrito]

    static constraints = {
        producto nullable:false
        fechaAgregado nullable:false
        fechaComprado nullable:true
        carrito nullable:false

    }

     static namedQueries = {
        query { search ->
            if (!Boolean.valueOf(search.includeDeleted)) {
                eq('deleted', false)
            }

            if (search.containsKey('id')) {
                eq('id', search.id)
            }
        }
    }
}
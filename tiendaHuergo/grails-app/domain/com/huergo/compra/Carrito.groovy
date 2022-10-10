package com.huergo.compra

import com.huergo.auth.User
import com.huergo.producto.Producto

class Carrito {
    static belongsTo = [usuario:User]
    static hasMany = [productos:Producto]
    static constraints = {
        usuario nullable:false
        productos nullable:true
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
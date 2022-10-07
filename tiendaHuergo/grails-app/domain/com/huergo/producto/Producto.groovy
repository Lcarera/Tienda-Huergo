package com.huergo.producto     

class Producto {

    Double precio
    Long cantidad
    TipoProducto tipo

    static hasMany = [talles:Talle]
    static constraints = {
        precio nullable:false
        cantidad nullable:false
        tipo nullable:false
        talles nullable:true
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
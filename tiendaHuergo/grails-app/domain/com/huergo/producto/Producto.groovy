package com.huergo.producto     

import com.huergo.inicializacion.JsonInicializacion
class Producto {

    String nombre
    Double precio
    Long cantidad
    TipoProducto tipo

    Talle talle
    static constraints = {
        nombre nullable:false
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
    
    public String toString(){
        return "$tipo-$nombre"
    
    }
    public String precioToString(){
        return JsonInicializacion.formatear(precio)
    }
}
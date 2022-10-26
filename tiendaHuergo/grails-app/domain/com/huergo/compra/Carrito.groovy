package com.huergo.compra

import com.huergo.auth.User
import com.huergo.producto.Producto

class Carrito {
    static belongsTo = [usuario:User]
    static hasMany = [productosVenta:ProductoVenta]
    static constraints = {
        usuario nullable:false
        productosVenta nullable:true
    }

    
}
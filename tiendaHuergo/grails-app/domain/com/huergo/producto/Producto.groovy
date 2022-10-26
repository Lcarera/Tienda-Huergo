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
        talle nullable:true
    }

   

    
    public String toString(){
        return "$tipo-$nombre"
    
    }
    public String precioToString(){
        return JsonInicializacion.formatear(precio)
    }
}
package com.huergo.producto

class TipoProducto {

    String tipo
    static constraints = {
        tipo nullable:false
    }

    

    public String toString() {
        return tipo
    }
}
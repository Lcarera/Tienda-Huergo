package com.huergo.compra
import com.huergo.auth.User

class Compra {
    String nomreContacto
    Boolean tieneEnvio

    String calle
    String departamento
    String codigoPostal
    String ciudad

    static belongsTo = [usuario:User]
    static hasMany = [productosVenta:ProductoVenta]
    static constraints = {
        usuario nullable:false
        productosVenta nullable:true
        calle nullable:true
        departamento nullable:true
        codigoPostal nullable:true
        ciudad nullable:true
    }

}
package com.huergo
import com.huergo.inicializacion.JsonInicializacion
class BootStrap {

    def init = { servletContext ->

        JsonInicializacion.inicializar()
    }
    def destroy = {
    }
}

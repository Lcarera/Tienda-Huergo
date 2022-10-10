package com.huergo.producto

import grails.transaction.Transactional

@Transactional
class ProductoService {

    def sessionFactory

    def getProductos(Long cuentaId){
        def query = """
            SELECT DISTINCT (NOMBRE)
            FROM PUBLIC.PRODUCTO
            WHERE CANTIDAD > 0;
        """

        return sessionFactory.currentSession.createSQLQuery(query).list().collect{
            def item = Producto.findByNombreAndCantidadNotEqual(it, 0)

            return item
        }
    }
}
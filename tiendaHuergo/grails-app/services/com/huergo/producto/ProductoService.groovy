package com.huergo.producto

import grails.transaction.Transactional
import com.huergo.auth.User
import com.huergo.compra.Carrito
import com.huergo.compra.ProductoVenta
import org.joda.time.LocalDateTime


@Transactional
class ProductoService {

    def sessionFactory

    def getProductos(){
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

    def agregarACarrito(Long productoId, User user) {
        def carrito = Carrito.findOrSaveWhere(usuario: user)
        carrito.save(flush:true, failOnError:true)
        def producto = Producto.get(productoId)
        if(!producto){
            Throw new Exception("No se encontro el producto con id: $productoId")
        }
        def producVenta = new ProductoVenta()
        producVenta.producto = producto
        producVenta.fechaAgregado = new LocalDateTime()
        producVenta.carrito = carrito
        producVenta.save(flush:true, failOnError:true)
        carrito.addToProductos(producVenta)
        carrito.save(flush:true, failOnError:true)
        return
    }
}
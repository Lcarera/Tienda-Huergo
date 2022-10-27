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
        def carrito = Carrito.findByUsuario(user)
        if(!carrito) {
            carrito = new Carrito()
            carrito.usuario = user
            carrito.save(flush:true, failOnError:true)
        }
        def producto = Producto.get(productoId)
        if(!producto){
            Throw new Exception("No se encontro el producto con id: $productoId")
        }
        def producVenta = new ProductoVenta()
        producVenta.producto = producto
        producVenta.fechaAgregado = new LocalDateTime()
        producVenta.carrito = carrito
        producVenta.save(flush:true, failOnError:true)
        carrito.addToProductosVenta(producVenta)
        carrito.save(flush:true, failOnError:true)
        return
    }

    def getCarrito(User user) {
        return Carrito.findByUsuario(user)
    }

    def cambiarTalle(Long productoVentaId, String talle) {
        def prod = ProductoVenta.get(productoVentaId)
        if(!prod){
            Throw new Exception("No se encontro el productoVenta con id: $productoVentaId")
        }

        def talleNuevo = Talle.findByTalle(talle)

        if(!talleNuevo){
            Throw new Exception("No se encontro el talle: $talle")
        }

        def nuevoProducto = Producto.findByNombreAndTalle(prod.producto.nombre, talleNuevo)

        if(!talleNuevo){
            Throw new Exception("No se encontro el producto: $prod.producto.nombre con talle $talle")
        }

        prod.producto = nuevoProducto
        prod.save(flush:true, failOnError:true)

    }

    def cambiarCantidad (Long productoVentaId, Integer cantidad) {
        def prod = ProductoVenta.get(productoVentaId)
        if(!prod){
            Throw new Exception("No se encontro el productoVenta con id: $productoVentaId")
        }

        prod.cantidad += cantidad

        prod.save(flush:true, failOnError:true)
        def resultado = [:]
        resultado.cantidad = prod.cantidad
        resultado.precio = prod.cantidad * prod.producto.precio
        return resultado
    }

    def eliminarProducto(Long productoVentaId) {
        def prod = ProductoVenta.get(productoVentaId)
        if(!prod){
            Throw new Exception("No se encontro el productoVenta con id: $productoVentaId")
        }
        prod.delete(flush:true, failOnError:true)
    }
}
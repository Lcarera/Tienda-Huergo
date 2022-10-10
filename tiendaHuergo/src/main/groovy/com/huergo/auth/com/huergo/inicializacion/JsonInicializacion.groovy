package com.huergo.inicializacion

import com.huergo.auth.Role
import com.huergo.auth.User
import com.huergo.auth.UserRole
import com.huergo.producto.Producto

import grails.converters.JSON
import java.text.DecimalFormat
import java.text.DecimalFormatSymbols
import org.joda.time.Days
import org.joda.time.LocalDate

class JsonInicializacion {
    private static DecimalFormat decimalCurencyFormat = null;
	private static DecimalFormat decimalCurencyFormatSinPunto = null;
	public static String formatear(numero){
		if (decimalCurencyFormat == null){
			// println "\nCreando formateador decimal...\n"
			String patternCurrency = '###,###,##0.00'
			decimalCurencyFormat = new DecimalFormat(patternCurrency)
			DecimalFormatSymbols otherSymbols = new   DecimalFormatSymbols(Locale.ENGLISH)
			otherSymbols.setDecimalSeparator(',' as char)
			otherSymbols.setGroupingSeparator('.' as char)
			decimalCurencyFormat.setGroupingUsed(true)
			decimalCurencyFormat.setDecimalFormatSymbols(otherSymbols)
		}
		return decimalCurencyFormat.format(numero)
	}

	public static String formatearSinPunto(numero){
		if (decimalCurencyFormatSinPunto == null){
			// println "\nCreando formateador decimal...\n"
			String patternCurrency = '###,###,##0.00'
			decimalCurencyFormatSinPunto = new DecimalFormat(patternCurrency)
			DecimalFormatSymbols otherSymbols = new   DecimalFormatSymbols(Locale.ENGLISH)
			otherSymbols.setDecimalSeparator(',' as char)
			otherSymbols.setGroupingSeparator('.' as char)
			decimalCurencyFormatSinPunto.setGroupingUsed(false)
			decimalCurencyFormatSinPunto.setDecimalFormatSymbols(otherSymbols)
		}
		def a_formatear = numero ?: 0
		return decimalCurencyFormatSinPunto.format(a_formatear)
	}

	static def inicializar(){
		JSON.registerObjectMarshaller(Producto){
			def returnArray = [:]

			returnArray['id'] = it.id
            returnArray['nombre'] = it.nombre
            returnArray['precio'] = "\$" + formatear(it.precio)
            returnArray['cantidad'] = it.cantidad
            returnArray['tipo'] = it.tipo.toString()

	
			return returnArray
		}

		JSON.registerObjectMarshaller(User){
			def returnArray = [:]

			returnArray['id'] = it.id
			returnArray['username'] = it.username
			returnArray['enabled'] = it.enabled
			if(it.enabled)
				returnArray['enabledText'] = 'Si'
			else
				returnArray['enabledText'] = 'No'

			returnArray['accountExpired'] = it.accountExpired
			returnArray['accountLocked'] = it.accountLocked
			returnArray['passwordExpired'] = it.passwordExpired

			def roles = UserRole.findAllByUser(it)

			returnArray['roleText'] = ""
			roles.each { userRole ->
				returnArray['roleText'] = userRole.role.authority
			}

			return returnArray
		}

		JSON.registerObjectMarshaller(Role){
			def returnArray = [:]

			returnArray['id'] = it.id
			returnArray['nombre'] = it.authority

			return returnArray
		}

		
	}
}

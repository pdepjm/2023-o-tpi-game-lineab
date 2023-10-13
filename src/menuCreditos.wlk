import wollok.game.*
import screenManagement.*
import Sonidos.*
import teclado.*

object menuCreditos {
	var seleccionado = 0
	const property position = game.at(0,0)
	
	method seleccionado() = seleccionado
	
	method modo() = seleccionado%3
	
	method sumarSeleccionado(num){
		seleccionado += num
	}
	
	method image() = "cande.png"
	
}

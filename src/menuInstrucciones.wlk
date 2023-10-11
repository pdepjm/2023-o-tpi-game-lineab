
import wollok.game.*
import screenManagement.*
import Sonidos.*
import teclado.*

object menuInstrucciones {
	var seleccionado = 0
	const property position = game.at(0,0)
	
	method seleccionado() = seleccionado
	
	method modo() = seleccionado%3
	
	method sumarSeleccionado(num){
		seleccionado += num
	}
	
	method image() = "MenuInstrucciones" + self.modo().toString() +".png"
}

/* PARA LA SECUENCIA DE IMAGENES DENTRO DE LAS INSTRUCCIONES, FALTAN IMAGENES FORMATO : tutorial+numero de imagen de instrucciones+numero de imagen de tutorial+.png
object tutoriales {
	var x = 0
	
	method x() = x%(CANTIDAD DE IMAGENES NECESARIAS)
	method image() = "tutorial"+ menuInstrucciones.modo().toString()+self.x().toString() +".png"
	method transicion() {game.onTick(1000,"transicion",{x = x + 1})}
}

*/
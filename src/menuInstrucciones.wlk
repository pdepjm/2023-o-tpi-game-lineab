

import wollok.game.*
import managerGeneral.*
import Sonidos.*
import teclado.*

object menuInstrucciones {
	var seleccionado = 0
	const property position = game.at(0,0)
	
	method reiniciarSeleccionado(){
		seleccionado = 0
	}
	
	method modo() = seleccionado%3
	
	method sumarSeleccionado(num){
		seleccionado += num
	}
	
	method image() = "MenuInstrucciones" + self.modo().toString() +".png"
	
	method volverAlMenu() {
		managerGeneral.configMenuInicial()
		sonido.stopmusicains()
	}
	
}

// PARA LA SECUENCIA DE IMAGENES DENTRO DE LAS INSTRUCCIONES, FALTAN IMAGENES FORMATO : tutorial+numero de imagen de instrucciones+numero de imagen de tutorial+.png

object tutoriales {
	var x =0
	const property position = game.at(14,7)
	method sumarx() {x = x+1}
	method restox() = x%12
	method image() = "tutorial"+ menuInstrucciones.modo().toString()+self.restox()+".png"
	method transicion() {game.onTick(1000,"transicion",{self.sumarx()})}
}

//"tutorial"+menuInstrucciones.modo().toString()+self.restox()+".png"



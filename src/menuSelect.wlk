import wollok.game.*
import screenManagement.*
import Sonidos.*
import teclado.*
import reloj.*
import celdas.*
import players.*

object menuSelect{
	var seleccionado = 0
	const property position = game.at(24,12)
	
	method seleccionado() = seleccionado
	
	method modo() = seleccionado%4
	
	method sumarSeleccionado(num){
		seleccionado += num
	}
	
	method image() = "MenuSelect" + self.modo().toString() +".png"
}

object managerMenuInicio{
	
	method accionar(){
		if(menuSelect.modo() == 3){
			screenManagement.cerrarJuego()
		}else if(menuSelect.modo() == 2){
			self.mostrarCreditos()
		}else if(menuSelect.modo() == 1){
			self.mostrarInstrucciones()
		}else{
			game.clear()
			celdasManager.inicializarPartida()
		}
	}
	
	method iniciarPartida(){
		jugadoresManagement.inicializarJugadores()
		screenManagement.configPartida()
		sonido.iniciarPartida()
		teclado.configPartida() 
		reloj.iniciarContador() 
	}
	
	method mostrarCreditos(){
		screenManagement.configCreditos()
		teclado.configCreditos()
		sonido.configCreditos()
	}
	
	method mostrarInstrucciones(){
		screenManagement.configInstrucciones()
		teclado.configInstrucciones()
		sonido.configInstrucciones()
	}
}

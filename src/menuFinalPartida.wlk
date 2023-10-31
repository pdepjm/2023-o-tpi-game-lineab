import wollok.game.*
import screenManagement.*
import Sonidos.*
import teclado.*
import reloj.*
import celdas.*
import managerGeneral.*

object menuFinalSelect{
	var seleccionado = 0
	const property position = game.at(20,7)
	
	method seleccionado() = seleccionado
	
	method modo() = seleccionado%3
	
	method sumarSeleccionado(num){
		seleccionado += num
	}
	
	method image() = "menuFinalSelect" + self.modo().toString() +".png"
}

object managerMenuFinal{
	
	method accionar(){
		sonido.stopMusicaMenuFinal()
		if(menuFinalSelect.modo() == 0){
			managerGeneral.iniciarPartida()
		}else if(menuFinalSelect.modo() == 1){ 
			managerGeneral.configMenuInicial()
		}else{
			managerGeneral.cerrarJuego()
		}
	}
}
import wollok.game.*
import screenManagement.*
import Sonidos.*
import teclado.*
import reloj.*

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
			self.reiniciarPartida()
		}else if(menuFinalSelect.modo() == 1){ 
			self.volverAlMenu()
		}else{
			screenManagement.cerrarJuego()
		}
		}
		
		method reiniciarPartida(){
			screenManagement.configPartida()
			sonido.iniciarPartida()
			teclado.configPartida()
			reloj.iniciarContador()
		}
		
		method volverAlMenu(){
			screenManagement.configuarMenuInicial()
	        sonido.configInicio()
	        teclado.configInicio()
		}
		}
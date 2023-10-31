import wollok.game.*
import managerGeneral.*

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
			managerGeneral.cerrarJuego()
		}else if(menuSelect.modo() == 2){
			managerGeneral.mostrarCreditos()
		}else if(menuSelect.modo() == 1){
			managerGeneral.mostrarInstrucciones()
		}else{
			managerGeneral.cargarPartida()
		}
	}
}
	

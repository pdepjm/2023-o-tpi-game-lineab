import wollok.game.*
import Sonidos.*
import menuSelect.*
import players.*
import direcciones.*
import menuFinalPartida.*

object teclado {
	method configInicio(){
	keyboard.up().onPressDo({sonido.switchMenu() menuSelect.sumarSeleccionado(3)})
	keyboard.down().onPressDo({sonido.switchMenu() menuSelect.sumarSeleccionado(1)})
	keyboard.enter().onPressDo({sonido.accionarInicio() managerMenuInicio.accionar()})
	}
	
	method configPartida(){
	keyboard.up().onPressDo({jugadorRojo.mirar(norte)})
	keyboard.down().onPressDo({jugadorRojo.mirar(sur)})
	keyboard.left().onPressDo({jugadorRojo.mirar(oeste)})
	keyboard.right().onPressDo({jugadorRojo.mirar(este)})
	keyboard.space().onPressDo({jugadorRojo.mirar(quieto)})
	}
	
	method configFinal(){
	keyboard.up().onPressDo({sonido.switchMenu() menuFinalSelect.sumarSeleccionado(2)})
	keyboard.down().onPressDo({sonido.switchMenu() menuFinalSelect.sumarSeleccionado(1)})
	keyboard.enter().onPressDo({sonido.accionarInicio() managerMenuFinal.accionar()})
	}
}

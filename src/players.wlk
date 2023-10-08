import wollok.game.*
import direcciones.*
import Sonidos.*

const jugadores = [jugadorRojo]

object jugadorRojo{
	var property position = game.at(2,2)
	var property mira = quieto 
	var puedeMoverse = false
	
	method image() = "jugadorRojo.png" 
	
	method puedeMoverse(_puedeMoverse){
		puedeMoverse = _puedeMoverse
	}
		
	method cambiarMira(direc){mira = direc}
	
	method mover(){
		mira.desplazar(self)
	}
	
	method moverNorte() {
		position = position.up(1)
		}
	method moverSur() {
		position = position.down(1)
	}
	method moverOeste() {
		position = position.left(1)
	}
	method moverEste() {
		position = position.right(1)
	}
	
	//No hay ningun error
	method mirar(direc){
		if(mira != direc &&  direc != mira.opuesto() && puedeMoverse){ 
			mira = direc
			sonido.movimientoGiro()
		}
	}
}
	

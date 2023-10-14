import wollok.game.*
import direcciones.*
import Sonidos.*
import celdas.*

const jugadores = [jugadorRojo]

object jugadorRojo{
	var property position = game.at(2,2)
	var property mira = quieto 
	var image = "enojado.jpg"
	var puedeMoverse = false
	
	method cuello() = "cuelloRojo30.png"
	method image() = image
	
	method puedeMoverse(_puedeMoverse){
		puedeMoverse = _puedeMoverse
	}
		
	method cambiarMira(direc){mira = direc}
	
	method moverYAccionarCelda(){
	  celdasManager.celda(self.position().x(), self.position().y()).cambiarColor(self)
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
	
	method cambiarImagen(){
		const imagenes = ["enojado.jpg", "feliz.jpg"]
		image = imagenes.anyOne()
	}
}

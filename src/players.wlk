import wollok.game.*
import direcciones.*
import Sonidos.*
import celdas.*
import spawns.*

const jugadores = [jugadorRojo]

object jugadorRojo{
	var property position = game.at(6,6)
	var property mira = quieto 
	var image = "enojado.jpg"
	var puedeMoverse = false
	const cuello = []
	var terreno = []
	
	//MOVIMIENTOS
	
	method image() = image
	
	method puedeMoverse(_puedeMoverse){
		puedeMoverse = _puedeMoverse
	}
		
	method cambiarMira(direc){mira = direc}
	
	method moverYAccionarCelda(){
	  mira.desplazar(self)
	  celdasManager.celda(self.position().x(), self.position().y()).interactuarCelda(self)
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
	
	//PARTIDA
	
	method agregarCelda(celda){
		terreno.add(celda)
	}
	
	method agregarCuello(celda){
		cuello.add(celda)
	}
	
	method adueniarseCuello(){
		if(cuello.isEmpty().negate())
		cuello.forEach({celda => celda.cambiarDuenio(self) celda.estanRobando(false)})
		terreno = terreno + cuello
		cuello.clear()
	}
	
	method suicidarse(){
		game.sound("suicidio" + 1.randomUpTo(4) + ".mp3").play()
		terreno.forEach({celda => celda.cambiarDuenio(neutral)})
		self.morir()
	}
	
	method morir(){
		self.puedeMoverse(false)
		self.mirar(quieto)
		cuello.forEach({celda => celda.desrobar()})
		cuello.clear()
		game.removeVisual(self)
		spawns.anyOne().reaparecerJugador(self)
	}
	
	method perderCelda(celda){
		terreno.remove(celda)
	}
}

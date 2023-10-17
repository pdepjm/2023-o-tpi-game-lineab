import wollok.game.*
import direcciones.*
import Sonidos.*
import celdas.*
import spawns.*

const jugadores = [jugadorRojo, jugadorAzul]

const numSonid = [1,2,3,4]
 
const jugadorRojo = new Jugador(nombre="jugadorRojo", image="enojado.jpg")
const jugadorAzul = new Jugador(nombre="jugadorAzul", image="jugadorAzul.jpg")

class Jugador{
	var property position = game.at(6,6)
	var property mira = quieto 
	var image //= "enojado.jpg"
	var puedeMoverse = false
	const cuello = []
	var terreno = []
	var nombre
	
	//MOVIMIENTOS
	
	method image() = image
	
	method puedeMoverse(_puedeMoverse){
		puedeMoverse = _puedeMoverse
	}
		
	method cambiarMira(direc){mira = direc}
	
	method moverYAccionarCelda(){
		if(puedeMoverse){
	  mira.desplazar(self)
	  celdasManager.celda(self.position().x(), self.position().y()).interactuarCelda(self)
	  }
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
	
	method nombre()=nombre
	
	//PARTIDA
	
	method agregarCelda(celda){
		terreno.add(celda)
	}
	
	method agregarCuello(celda){
		cuello.add(celda)
	}
	
	method adueniarseCuello(){
		if(cuello.isEmpty().negate()){
		cuello.forEach({celda => celda.cambiarDuenio(self) celda.estanRobando(false)})
		terreno = terreno + cuello
		cuello.clear()
		}
	}
	
	method suicidarse(){
		if(mira != quieto){
		game.sound("suicidio" + (numSonid.anyOne()).toString() + ".mp3").play()
		terreno.forEach({celda => celda.cambiarDuenio(neutral)})
		self.morir()
		}
	}
	
	method morir(){
		self.mirar(quieto)
		self.puedeMoverse(false)
		cuello.forEach({celda => celda.desrobar()})
		cuello.clear()
		game.removeVisual(self)
		spawns.anyOne().reaparecerJugador(self)
	}
	
	method perderCelda(celda){
		terreno.remove(celda)
	}
	
	method terreno() = terreno
	
	method matar(ladron){
		game.sound("kill" + (numSonid.anyOne()).toString() + ".mp3").play()
		ladron.terreno().forEach({celda => celda.cambiarDuenio(self)})
		ladron.morir()
	}
}

/*object jugadoresManagement{
	method inicializarJugadores(){
		jugadores.clear()
		const jugadorRojo = new Jugador()
		var jugadorAzul = new Jugador()
        jugadores.add(jugadorRojo)
        jugadores.add(jugadorAzul)		
	}
	
}*/

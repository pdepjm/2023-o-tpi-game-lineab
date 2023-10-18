import wollok.game.*
import direcciones.*
import celdas.*

const spawns = []


class Spawn {
	const posCentralX
	const posCentralY
	
	method reaparecerJugador(jugador){
		spawns.remove(self) //Durante 10 segundos desde que un player reaparezca nadie puede volver a reaparecer en su spwan
		game.schedule(13000, {spawns.add(self)}) 
		jugador.position(game.at(posCentralX, posCentralY))
		game.schedule(3000, {game.addVisual(jugador) self.darTerrenoInicial(jugador) jugador.puedeMoverse(true)}) 	    
	}
	
	method aparecerJugador(jugador){//para el principio de la partida
		spawns.remove(self)
		game.schedule(13000, {spawns.add(self)}) 
		jugador.mira(quieto)
		jugador.position(game.at(posCentralX, posCentralY))
		self.darTerrenoInicial(jugador)
		game.addVisual(jugador)
	}
	
	method darTerrenoInicial(jugador){/*Falta Terminar (es de 3x3 */
	  celdasManager.celda(posCentralX -2, posCentralY - 2).cambiarDuenio(jugador)
	  celdasManager.celda(posCentralX -2 , posCentralY).cambiarDuenio(jugador)
	  celdasManager.celda(posCentralX -2, posCentralY + 2).cambiarDuenio(jugador)
	  celdasManager.celda(posCentralX, posCentralY -2).cambiarDuenio(jugador)
	  celdasManager.celda(posCentralX, posCentralY).cambiarDuenio(jugador)
	  celdasManager.celda(posCentralX, posCentralY +2).cambiarDuenio(jugador)
	  celdasManager.celda(posCentralX +2, posCentralY -2).cambiarDuenio(jugador)
	  celdasManager.celda(posCentralX +2,  posCentralY).cambiarDuenio(jugador)
	  celdasManager.celda(posCentralX +2, posCentralY +2).cambiarDuenio(jugador)
	  }
}

object spawnsManager{
	method inicializarSpawns(){//MANAGER
		spawns.clear() //por si se reinicia la partida
		spawns.add(new Spawn(posCentralX = 26, posCentralY = 6))
		spawns.add(new Spawn(posCentralX = 26, posCentralY = 6))
		spawns.add(new Spawn(posCentralX = 6, posCentralY = 18))
		spawns.add(new Spawn(posCentralX = 6, posCentralY = 26))
		spawns.add(new Spawn(posCentralX = 26, posCentralY = 26))
		spawns.add(new Spawn(posCentralX = 58, posCentralY = 18))
		spawns.add(new Spawn(posCentralX = 26, posCentralY = 26))
		spawns.add(new Spawn(posCentralX = 58, posCentralY = 18))
	}
}

/*Spawns tamaño viejo
new Spawn(posCentralX = 57, posCentralY = 3)
new Spawn(posCentralX = 19, posCentralY = 3)
new Spawn(posCentralX = 3, posCentralY = 7)
new Spawn(posCentralX = 3, posCentralY = 22)
new Spawn(posCentralX = 19, posCentralY = 29)
new Spawn(posCentralX = 57, posCentralY = 29)
new Spawn(posCentralX = 76, posCentralY = 22)
new Spawn(posCentralX = 76, posCentralY = 7)
*/

//CASILLAS LIMITE
//Oeste2
//Sur2
//Este77
//Norte30
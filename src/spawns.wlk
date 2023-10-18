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
	
	method darTerrenoInicial(jugador){
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
		spawns.add(new Spawn(posCentralX = 16, posCentralY = 4))
		spawns.add(new Spawn(posCentralX = 58, posCentralY = 4))
		spawns.add(new Spawn(posCentralX = 4, posCentralY = 14))
		spawns.add(new Spawn(posCentralX = 16, posCentralY = 26))
		spawns.add(new Spawn(posCentralX = 58, posCentralY = 26))
		spawns.add(new Spawn(posCentralX = 74, posCentralY = 14))
	}
}
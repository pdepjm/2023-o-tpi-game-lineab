import wollok.game.*

const spawns = [spawn1, spawn2, spawn3, spawn4, spawn5, spawn6, spawn7, spawn8]


class Spawn {
	const posCentralX
	const posCentralY
	
	method aparecerJugador(jugador){
		spawns.remove(self) //Durante 10 segundos desde que vos reaparezcas
		game.schedule(13000, {spawns.add(self)}) // nadie puede volver a reaparecer en tu spwan
		jugador.position(game.at(posCentralX, posCentralY))
		game.schedule(3000, {game.addVisual(jugador) self.darTerrenoInicial(jugador)}) 
	}
	
	method darTerrenoInicial(jugador){/*Falta Terminar (es de 3x3 */}
}

const spawn1 = new Spawn(posCentralX = 57, posCentralY = 3)
const spawn2 = new Spawn(posCentralX = 19, posCentralY = 3)
const spawn3 = new Spawn(posCentralX = 3, posCentralY = 7)
const spawn4 = new Spawn(posCentralX = 3, posCentralY = 22)
const spawn5 = new Spawn(posCentralX = 19, posCentralY = 29)
const spawn6 = new Spawn(posCentralX = 57, posCentralY = 29)
const spawn7 = new Spawn(posCentralX = 76, posCentralY = 22)
const spawn8 = new Spawn(posCentralX = 76, posCentralY = 7)


//CASILLAS LIMITE
//Oeste2
//Sur2
//Este77
//Norte30
/* 
import celdas.*
import wollok.game.*
import players.*

object rankingManager {
	method porcentajeCeldas(jugador)= ((celdas.filter{celda=>celda.duenio()==jugador}).size() * 100) . div(408)
	
}

object fotoJugador{
	const property position = game.at(0,16)
	method image() = "jugadorRojo.png"
	}
	
object digito1R{
	const property position = game.at(1,16) 
	method image() = "ranking("  + (rankingManager.porcentajeCeldas(jugadorRojo) . div(100)) . toString() + ").png"
}

object digito2R{
	const property position = game.at(2,16) 
	method image() = "ranking" + (rankingManager.porcentajeCeldas(jugadorRojo) . div(10)) . toString() + ".png"
}

object digito3R{
	const property position = game.at(3,16) 
	method image() = "ranking" + (rankingManager.porcentajeCeldas(jugadorRojo) %10) .toString() +  ".png"
}

object digito4R{
	const property position = game.at(5,16) 
	method image() = "rankingPorcentaje.png"
}*/
 
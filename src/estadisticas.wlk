
import celdas.*
import wollok.game.*
import players.*

/* 
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


//ESTADISTICAS FINAL PARTIDA

object killer{
	var killer
	var kills
	
	method image() = "statKiller_" + killer.nombre().toString() + ".png"
   
    method establecerKiller(){
    	killer = jugadores.max{jugador => jugador.kills()}
    	kills = killer.kills()
    }
    
    method establecerContadores(){
    	if(kills < 10){
    		contadorKills1.digito(kills)
    		game.addVisual(contadorKills1)
    	}else{
    		contadorKills1.digito(kills.div(10))
    		contadorKills2.digito(kills % 10)
    		game.addVisual(contadorKills1)
    		game.addVisual(contadorKills2)
    	}
    	}
    	
    	method mostrarKiller(){
    		self.establecerKiller()
    		self.establecerContadores()
    		game.addVisual(self)
    	}
}

const contadorKills1 = new ContadorStat(posX = 6, posY = 5)

const contadorKills2 = new ContadorStat(posX = 6, posY = 5)

object sobreviviente{
	var sobreviviente
	var tiempoSobrevivido
	
	method image() = "statsobreviviente_" + sobreviviente.nombre().toString() + ".png"
   
    method establecerSobreviviente(){
    	sobreviviente = jugadores.max{jugador => jugador.tiempoSobrevivido()}
    	tiempoSobrevivido = sobreviviente.tiempoSobrevivido()
    }
    
    method establecerContadores(){
    	minuteroTiempoSobr.digito(tiempoSobrevivido.div(60))
    	segunderoTiempoSobr1.digito((tiempoSobrevivido % 60).div(10))
    	segunderoTiempoSobr2.digito(((tiempoSobrevivido % 60)%10))
    	}
    	
    	method mostrarSobreviviente(){
    		self.establecerSobreviviente()
    		self.establecerContadores()
    		game.addVisual(self)
    		game.addVisual(minuteroTiempoSobr)
    		game.addVisual(segunderoTiempoSobr1)
    		game.addVisual(segunderoTiempoSobr2)
    	}
}

const minuteroTiempoSobr = new ContadorStat(posX = 30, posY = 5)

const segunderoTiempoSobr1 = new ContadorStat(posX = 32, posY = 5)

const segunderoTiempoSobr2 = new ContadorStat(posX = 33, posY = 5)


class ContadorStat{
	var digito = 0
	var posX
	var posY
	
	method image() = "contadorStats" + digito.toString() + ".png"
    method position() = game.at(posX,posY)
    method digito(_digito){
    	digito = _digito
    }
}

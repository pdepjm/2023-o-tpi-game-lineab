import wollok.game.*
import menuSelect.*

const celdas = []

class Celda{
	const posX
	const posY
	var image = "fondo.png"
	method position() = game.at(posX, posY)
    method image() = image
    
    method desaparecer(){
    	game.removeVisual(self)
    }
    
    method cambiarColor(jugador){
    	image= jugador.cuello()
    }
}

object celdasManager{
	var i = 5
	var j = 5
	
		
	method inicializarCeldas(){
	game.onTick(1,"Inicializando Celdas",{self.crearCeldas()})
	}
	
	method crearCeldas(){	
		if(i<=38){//38
			if(j<=15){//17
				self.agregarCelda(new Celda(posX = i, posY = j))
				j += 1
			}else{
			j = 5
			i += 1
			self.agregarCelda(new Celda(posX = i, posY = j))
			}
		}else{
		game.removeTickEvent("Inicializando Celdas") 
        managerMenuInicio.iniciarPartida()	
	}
	}
	
	
	method agregarCelda(celda){
		celdas.add(celda)
		game.addVisual(celda)
	}
}

//2
//2
//77
//33
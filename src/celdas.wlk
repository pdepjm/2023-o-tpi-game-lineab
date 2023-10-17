import wollok.game.*
import menuSelect.*

const celdas = []

class Celda{
    const posX
    const posY
    
    var property duenio = neutral
    var estanRobando = false 
    var ladron = neutral
    var property image = "celda_neutral.png"

    method position() = game.at(posX, posY)
     
    method estanRobando(_valor){
    	estanRobando = _valor
    } 

    method interactuarCelda(jugador){
    	if(estanRobando){
    		if(ladron == jugador){
    			jugador.suicidarse()
    		}else{
    			//matas
    		}
    	}else{
    		if(duenio != jugador){
    			estanRobando = true
    			ladron = jugador
    			image = "celda_robada_" + jugador.toString() + ".png"
    			jugador.agregarCuello(self)
    		}else{
    			jugador.adueniarseCuello()
    			//rellenar
    		
    		}
    	}
    }   

 
    method cambiarDuenio(jugador){
    	duenio.perderCelda(self)
    	duenio = jugador
    	duenio.agregarCelda(self)
        self.desrobar()
    }
    
    method desrobar(){
    	ladron = neutral
    	estanRobando = false
    	image = "celda_" + duenio.toString() + ".png"
    }
}

object celdasManager{
    var i = 5
    var j = 4


    method inicializarPartida(){
    celdas.clear() //por si se reinicia la partida
    game.onTick(1,"Inicializando Celdas",{self.crearCeldas()})
    }

    method crearCeldas(){
        if(i<=38){//38
            if(j<=15){//17
                self.agregarCelda(new Celda(posX = i, posY = j))
                j += 1
            }else{
            j = 4
            i += 1
            }
        }else{
        game.removeTickEvent("Inicializando Celdas")
        i = 5 //Reinicia los contadores para cuando se reinicia la partida
        j = 4
        managerMenuInicio.iniciarPartida()
    }
    }

//54 55 56 57 58 59 510 511 512 513 514 515 64

    method agregarCelda(celda){
        celdas.add(celda)
        game.addVisual(celda)
    }


//(5.4)     
    method celda(posX, posY) = celdas.get(12 * posX + posY - 64)
}

object neutral{
	method perderCelda(celda){}
	
	method agregarCelda(){}
}

//2
//2
//77
//33

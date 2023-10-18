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

    method interactuarCelda(jugador){ // REVISAR: Los tipitos se están muriendo cuando chocan con un borde
    	if(estanRobando){
    		if(ladron == jugador){
    			jugador.suicidarse()
    		}else{
    			jugador.matar(ladron)
    			self.robadaPor(jugador)
    		}
    	}else{
    		if(duenio != jugador){
    			self.robadaPor(jugador)
    		}else{
    			jugador.adueniarseCuello()
    			//rellenar
    		}
    	}
    }   
    
    method robadaPor(jugador){
    	estanRobando = true
    	ladron = jugador
    	image = "celda_robada_" + jugador.nombre() +  ".png"
    	jugador.agregarCuello(self)
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
    	image = "celda_" + duenio.nombre() + ".png"
    }
}

object celdasManager{
    var i = 2
    var j = 2


    method inicializarPartida(){
    celdas.clear() //por si se reinicia la partida
    game.onTick(1,"Inicializando Celdas",{self.crearCeldas()})
    }

    method crearCeldas(){
        if(i<= 76){//38
            if(j<= 28){//17
                self.agregarCelda(new Celda(posX = i, posY = j))
                j += 2
            }else{
            j = 2
            i += 2
            }
        }else{
        game.removeTickEvent("Inicializando Celdas")
        i = 2 //Reinicia los contadores para cuando se reinicia la partida
        j = 2
        managerMenuInicio.iniciarPartida()
    }
    }

//22 24 26 28 210 212 214 216 218 220 222 224 226 228 42

    method agregarCelda(celda){
        celdas.add(celda)
        game.addVisual(celda)
    }


//(5.4)     
    method celda(posX, posY) = celdas.get(7 * posX + posY/2 - 15)
}

object neutral{ //Es un objeto de la clase Jugador???
	method perderCelda(celda){}
	method suicidarse(){}
	method agregarCelda(celda){}
	method matar(ladron){}
	method adueniarseCuello(){}
	method agregarCuello(celda){}
	method nombre()="neutral"
	method morir(){}
}

//2
//2
//77
//33

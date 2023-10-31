import wollok.game.*
import menuSelect.*
import screenManagement.*

const celdas = []

class Celda{
    const posX
    const posY

    var property duenio = neutral
    var property estanRobando = false 
    var ladron = neutral
    var property image = "celda_neutral.png"
    
    method celdaSup()= celdasManager.celda(posX+2,posY+2)
    method celdaInf()= celdasManager.celda(posX-2,posY-2)
    method celdaDer()= celdasManager.celda(posX+2,posY-2)
    method celdaIzq()= celdasManager.celda(posX-2,posY+2)

	method estanRobando() = estanRobando
	method duenio()=duenio
	
    method position() = game.at(posX, posY)
 
    method estanRobando(_valor){
    	estanRobando = _valor
    } 

    method interactuarCelda(jugador){ 
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
    			self.rellenar(jugador)
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
    
    method rellenar(jugador){
    celdasManager.celda(posX+2,posY+2).intentarRellenar(jugador)
    celdasManager.celda(posX-2,posY-2).intentarRellenar(jugador)
    celdasManager.celda(posX+2,posY-2).intentarRellenar(jugador)
    celdasManager.celda(posX-2,posY+2).intentarRellenar(jugador)
    }
    
    method intentarRellenar(jugador){
    	if(duenio != jugador || self.estaCruzada(jugador)){
    		self.completar(jugador)
    	}
    }

    method estaCruzada(jugador) = self.algunaSupEsMia(jugador) && self.algunaInfEsMia(jugador) && self.algunaDerEsMia(jugador) && self.algunaIzqEsMia(jugador)
    
    method algunaSupEsMia(jugador) = self.esMia(jugador) || self.celdaSup().algunaSupEsMia(jugador) 
    method algunaInfEsMia(jugador) = self.esMia(jugador) || self.celdaSup().algunaInfEsMia(jugador)
    method algunaDerEsMia(jugador) = self.esMia(jugador) || self.celdaSup().algunaDerEsMia(jugador) 
    method algunaIzqEsMia(jugador) = self.esMia(jugador) || self.celdaSup().algunaIzqEsMia(jugador)
    
    method esMia(jugador) = duenio == jugador
    
    method completar(jugador){
    	if(self.estaRodeada(jugador)){
    	jugador.completar()
    	}else{
    		jugador.vaciarConsultadas()
    	}
    }   
   
    method estaRodeada(jugador){
    jugador.consulto(self)
    return self.esMia(jugador) || (self.celdaSup().estaRodeada(jugador) && self.celdaInf().estaRodeada(jugador) && self.celdaDer().estaRodeada(jugador) && self.celdaIzq().estaRodeada(jugador))       
 }
}

class CeldaBorde inherits Celda{
	override method estaRodeada(jugador) = duenio == jugador
	
	override method celdaSup() = self
	override method celdaInf() = self
	override method celdaDer() = self
	override method celdaIzq() = self
	
	override method estaCruzada(jugador) = false
	
	//////
	override method algunaSupEsMia(jugador) = self.esMia(jugador)  
    override method algunaInfEsMia(jugador) = self.esMia(jugador) 
    override method algunaDerEsMia(jugador) = self.esMia(jugador)  
    override method algunaIzqEsMia(jugador) = self.esMia(jugador) 
    //////
    
    override method intentarRellenar(jugador){}
    override method rellenar(jugador){}
}

object celdasManager{
    var i = 2
    var j = 2


    method inicializarPartida(){ //Cuando agreguemos las celdas del borde hay que avanzar el contador de la pantalla de carga
    celdas.clear() //por si se reinicia la partida
    game.onTick(1,"Inicializando Celdas",{self.crearCeldas()})
    }

    method crearCeldas(){
        if(i<= 76){//38
            if(j<= 28){//17
            if(j != 2 && j != 28 && i != 2 && i != 76){
                self.agregarCelda(new Celda(posX = i, posY = j))
                if(i == 12 || i == 24 || i == 36 || i == 48 || i == 60 || i == 72 ) pantallaCarga.avanzarContador()
                }else{ 
                self.agregarCelda(new CeldaBorde(posX = i, posY = j)) 
                }
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
	method nombre() = "neutral"
	method morir(){}
}

//2
//2
//77
//33

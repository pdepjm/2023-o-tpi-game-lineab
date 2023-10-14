import wollok.game.*
import menuSelect.*

const celdas = []

class Celda{
    const posX
    const posY
    
    var duenio = "neutral"
    var estanRobando = 0 
    var ladron = "nadie"
    var property image = "celda_neutral.png"

    method position() = game.at(posX, posY)
     

    method cambiarColor(_duenio){
    	image = "celda_" + _duenio.toString() + ".png"
    }   

 
    method desaparecer(){
        game.removeVisual(self)
    }
}

object celdasManager{
    var i = 5
    var j = 4


    method inicializarCeldas(){
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

//2
//2
//77
//33

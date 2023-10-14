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
    	image = "celda_" + _duenio.toSting() + ".png"
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


    method agregarCelda(celda){
        celdas.add(celda)
       // game.addVisual(celda)
    }

    method celda(posX, posY) = celdas.get(posY * 11 + posX - 5)
}

//2
//2
//77
//33

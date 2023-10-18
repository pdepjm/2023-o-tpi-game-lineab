import wollok.game.*
import players.*
import screenManagement.*


const estrella = new Poder (image = "poderEstrella.png")
const charcoLodo = new Poder (image = "podercharcoLodo.png")

class Poder {
	var property position = game.center()
    var image
    
    method image() = image
    
	method movete() { //para que se aparezca en una posicion random
    const x = 0.randomUpTo(game.width()).truncate(0)  
    const y = 0.randomUpTo(game.height()).truncate(0)
    position = game.at(x,y)
    }
    }
   

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
    const x = 10.randomUpTo(game.width()- 10).truncate(0)  
    const y = 10.randomUpTo(game.height()- 10).truncate(0)
    position = game.at(x,y)
    }
    }
 

import players.*

//Las direcciones se encargan de desplazar constantemente a los jugadores 
//de que estos no se pasen de los limites
// y de que no puedan darse vuelta instantaneamente

object norte {
	method desplazar(jugador){
		if(jugador.position().y() < 27) {
			jugador.moverNorte()
			jugador.puedeSuicidarse(true)
			}
		else {jugador.puedeSuicidarse(false)}
	}
	method opuesto() = sur	
}

object sur {	
	method desplazar(jugador){
		if(jugador.position().y() > 2) {
			jugador.moverSur()
			jugador.puedeSuicidarse(true)
			}
		else {jugador.puedeSuicidarse(false)}
		
	}	
	
	method opuesto() = norte	
}

object este {
	method desplazar(jugador){
		if(jugador.position().x() < 75) {
			jugador.moverEste()
			jugador.puedeSuicidarse(true)
			}
		else {jugador.puedeSuicidarse(false)}
		
	}	
	
	method opuesto() = oeste	
}

object oeste {
	method desplazar(jugador){
		if(jugador.position().x() > 2) {
			jugador.moverOeste()
			jugador.puedeSuicidarse(true)
			}
		else {jugador.puedeSuicidarse(false)}
		
	}	
	
	method opuesto() = este	
}

object quieto {
		method desplazar(jugador) = jugador.puedeSuicidarse(false)
		
		method opuesto() = self   //quieto no tiene opuesto 		
}

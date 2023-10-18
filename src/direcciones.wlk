import players.*

//Las direcciones se encargan de desplazar constantemente a los jugadores 
//de que estos no se pasen de los limites
// y de que no puedan darse vuelta instantaneamente

object norte {
	method desplazar(jugador){
		if(jugador.position().y() < 26) jugador.moverNorte()
	}
	method opuesto() = sur	
}

object sur {	
	method desplazar(jugador){
		if(jugador.position().y() > 2) jugador.moverSur()
	}	
	
	method opuesto() = norte	
}

object este {
	method desplazar(jugador){
		if(jugador.position().x() < 74) jugador.moverEste()
	}	
	
	method opuesto() = oeste	
}

object oeste {
	method desplazar(jugador){
		if(jugador.position().x() > 2) jugador.moverOeste()
	}	
	
	method opuesto() = este	
}

object quieto {
		method desplazar(jugador){}
		
		method opuesto() = self   //quieto no tiene opuesto 		
}

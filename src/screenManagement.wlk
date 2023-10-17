import wollok.game.*
import menuSelect.*
import players.*
import reloj.*
import menuFinalPartida.*
import menuInstrucciones.*
import menuCreditos.*
import celdas.*
import spawns.*
//import ranking.*

object screenManagement {
	method configurarInicio(){
	game.width(45)
	game.height(20)
	game.cellSize(40)
	game.boardGround("fondoCeldas30.png")
	}
	
	method configuarMenuInicial(){
	game.clear()
	game.addVisual(fondoNegro)
	game.addVisual(fondoMenuInicio)
	game.addVisual(menuSelect)
	}
	
	method configPartida(){
	spawnsManager.inicializarSpawns()
	jugadores.forEach({jugador => spawns.anyOne().aparecerJugador(jugador)})
	game.addVisual(marcoFondo)
	game.addVisual(minutero1)
	game.addVisual(minutero2)
	game.addVisual(segundero1)
	game.addVisual(segundero2)
	game.addVisual(logoMenu)
	game.addVisual(contadorInicio)
	/* 
	game.addVisual(digito1R)
	game.addVisual(digito2R)
	game.addVisual(digito3R)
	game.addVisual(digito4R)*/
	contadorInicio.iniciar()
	//game.onTick(500, "Animacion Jugador", {jugadores.forEach({jugador => jugador.cambiarImagen()})})
	game.schedule(3000,{
		game.removeVisual(contadorInicio)
		contadorInicio.estadoInicial()
		game.addVisual(goInicio)
		game.schedule(1000, {game.removeVisual(goInicio)})
		jugadores.forEach({jugador => jugador.puedeMoverse(true)})
		game.onTick(200,"Mover a los Jugadores", {jugadores.forEach({jugador => jugador.moverYAccionarCelda()})})
		game.onTick(1000, "Actualizar Reloj", {reloj.avanzarTiempo()})
		})
	}
	
	method configInstrucciones(){
	game.clear()
	menuInstrucciones.reiniciarSeleccionado()
	game.addVisual(menuInstrucciones)
	// PARA LA SECUENCIA DE IMAGENES DENTRO DE LAS INTRUCCIONES
	//tutoriales.transicion()
	//game.addVisual(tutoriales)
	}

	method configCreditos(){
	game.clear()
	game.addVisual(menuCreditos)
	}

	method cerrarJuego(){
		game.clear()
		game.width(1)
	    game.height(1)
	    game.cellSize(1)
	}
	
	method terminarPartida(){
		game.addVisual(barraTiempoOut)
		game.removeVisual(minutero1)
		game.removeVisual(minutero2)
		game.removeVisual(segundero1)
		game.removeVisual(segundero2)
		game.addVisual(fondoTimeOut)
		game.addVisual(timeOut)
		game.schedule(3000 , {game.removeVisual(barraTiempoOut) game.addVisual(barraWinner)})
		game.schedule(7500, {game.removeVisual(barraWinner) game.addVisual(fondoMenuFinal) game.addVisual(menuFinalSelect)})
	} 
}

  

//JUEGO CERRADO

object fondoNegro{
	method image() = "fondoNegro.png"
	
	method position() = game.at(-2,-2)
}

//MENU INICIO

object fondoMenuInicio{
	method image() = "fondoInicioAgrandar.png"
	method position() = game.at(10, 0)
}

//PARTIDA

object contadorInicio{
	var contador = 3
	const property position = game.at(35,10)
	
	method image() = "contadorInicial" + contador.toString() + ".png"
	
	method avanzarContador(){
		contador -= 1
	}

	method iniciar(){
		game.onTick(1000, "contadorInicio" ,{self.avanzarContador()})
		game.schedule(2900, {game.removeTickEvent("contadorInicio")})
	}
	
	method estadoInicial(){ contador = 3}
	
}

object goInicio{
	method position() = game.at(27,10)
	method image() = "goInicio.png"
}

object logoMenu {
	method image() = "logotipoMenu.png"
	method position() = game.at(75,32)
}

object marcoFondo {
	method image() = "marcoPartida_" + reloj.color() + ".png" //el marco del reloj esta incluido en el marco violeta, por eso depende del color del reloj
	method position() = game.at(4,3)
}

//MENU INSTRUCCIONES






















//FINAL PARTIDA

object barraTiempoOut{
	const property position = game.at(-1,13)
	const property image = "barraTiempoFinalizado.png"
}

object barraWinner{
	const property position = game.at(-1,4)
	const property image = "barraWinner.png"
}

object fondoMenuFinal{
	const property position = game.at(9,7)
	const property image = "menuFinalPartida.png"
}

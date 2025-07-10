import MainGame.*
import objetos.*

object menuPrincipal {
  const musica = game.sound("musica.mp3")

  var fondo = "FondoConFueguito.png"
  
  method mainMenu() {
    
    musica.shouldLoop(true)
    game.clear()
    game.boardGround(fondo)
    jugar.initialize()
    instrucciones.initialize()
    nosotros.initialize()
    enter.initialize()
    keyboard.enter().onPressDo({ self.logicEnter() })
    game.addVisual(nombreJuego)
    game.addVisual(jugar)
    game.addVisual(instrucciones)
    game.addVisual(nosotros)
    game.addVisual(enter)
    game.addVisual(movimiento)
    game.addVisual(puntero2)
    keyboard.b().onPressDo({ musica.volume(1) })
    keyboard.m().onPressDo({ musica.volume(0) })
    keyboard.n().onPressDo({ musica.volume(0.5) })
    keyboard.w().onPressDo({ puntero2.subir()
    musica.play() })
    keyboard.s().onPressDo({ puntero2.bajar() 
    musica.play()
    })
  }
  method reproducirMusica(){
		musica.reproducir()
	  game.onTick(148000, "musica1", {musica.reproducir()})
	}

  method logicEnter() {
    if (puntero2.position().y() == 3) {
      game.clear()
      juego.iniciar()
    } else {
      if (puntero2.position().y() == 2) {
        pantallaInstrucciones.iniciar()
      } else {
        if (puntero2.position().y() == 1) {
          game.clear()
          pantallaSomos.iniciar()
          pantallaSomos.hablar()
        }
      }
    }
  }
}

class Sonido{
	const property sonido 
	
	method reproducir(){
		game.sound(sonido).play()
	}
	method parar(){
		game.sound(sonido).stop()
	}
}

object nombreJuego {
  var property position = game.at(0, 3)
  method image() = "logoGame.png"
}

object puntero2 {
  var property position = game.at(2, 3)
  const image = "cursorTest.gif"
  method image() = image
  method subir() {
    if ((position.y() == 1) || (position.y() == 2)) {
      position = position.up(1)
    }
  }
  method bajar() {
    if ((position.y() == 3) || (position.y() == 2)) {
      position = position.down(1)
    }
  }
}
//////////////////////////////////////////////////////  Seleccion Menu Principal

class Opcion {
  var property imagen //posible imagen
  var position
  var property estaColisionando = false
}

object jugar inherits Opcion {
  method initialize() {
    position = game.at(3,3)
    imagen = "jugar(2).png"
  }
  
  method position() = position
  
  method image() = imagen
}

object instrucciones inherits Opcion {
  method initialize() {
    imagen = "op2_580x137.png"
    position = game.at(3,2)
  }
  
  method position() = position
  
  method image() = imagen
}

object nosotros inherits Opcion {
  method initialize() {
    imagen = "o3.png"
    position = game.at(3,1)
  }
  
  method position() = position
  
  method image() = imagen
}

object enter inherits Opcion {
  method initialize() {
    position = game.at(2,0)
    imagen = "botonEnter.png"
  }
  
  method position() = position
  
  method image() = imagen
}

object movimiento inherits Opcion {
  method initialize() {
    position = game.at(0,0)
    imagen = "movimiento.png"
  }
  
  method position() = position
  
  method image() = imagen
}

object paletaColores {
  const property violeta = "4C2882"
} /////////////////////////////////////////////// Nosotros

object pantallaSomos {
  method iniciar() {
    game.clear()
    game.addVisual(equipo)
    game.addVisual(indicador)
    game.addVisual(adMoverse)
    keyboard.d().onPressDo({ indicador.moverDerecha() })
    keyboard.a().onPressDo({ indicador.moverIzquierda() })
    keyboard.m().onPressDo({ menuPrincipal.mainMenu() })
  }
  
  method hablar() {
    if (indicador.position() == (game.at(0,2))){
      keyboard.enter().onPressDo(
        { mensajeHablar.image("Nahuel.png")
          mensajeHablar.position(game.at(2,6))
          game.addVisual(mensajeHablar)
          game.schedule(2000, {game.removeVisual(mensajeHablar)})
        }
      )
    }
    if (indicador.position() == (game.at(3,2))){
      keyboard.enter().onPressDo(
        {mensajeHablar.image("Ariel.png")
         mensajeHablar.position(game.at(4,6))
         game.addVisual(mensajeHablar)
         game.schedule(2000, {game.removeVisual(mensajeHablar)})
         }
      )
    }
    if (indicador.position() == (game.at(6,2))){
      keyboard.enter().onPressDo(
        { mensajeHablar.image("Laura.png")
          mensajeHablar.position(game.at(7,6))
          game.addVisual(mensajeHablar)
          game.schedule(2000, {game.removeVisual(mensajeHablar)})
        }
      )
    }
    if (indicador.position() == (game.at(9,2))){
      keyboard.enter().onPressDo(
        { mensajeHablar.image("Cristian.png")
          mensajeHablar.position(game.at(7,7))
          game.addVisual(mensajeHablar)
          game.schedule(2000, {game.removeVisual(mensajeHablar)})
        }
      )
    }
  }
}

object equipo {
  var property position = game.at(0, 0)
  
  method image() = "prueba.png"
}

object adMoverse{
  var property position = game.at(0,0)
  
  method image() = "controlsF.png"
}

object indicador {
  var property image = "arrow.png"
  var property position = game.at(0, 2)
  var property texto = 0
  
  method moverDerecha() {
    if (position.x() < 9) {
      position = position.right(3)
      console.println(self.position())
      pantallaSomos.hablar()
    }
  }
  
  method moverIzquierda() {
    if (position.x() > 1) {
      position = position.left(3)
      console.println(self.position())
      pantallaSomos.hablar()
    }
  }
}
  object mensajeHablar{
    var property image = ""
    var property position = game.at(0,0)
    
  }


 /////////////////////////////////////////////// Instrucciones

object pantallaInstrucciones {
  method iniciar() {
    game.clear()
    game.addVisual(instruccionesText)
    keyboard.m().onPressDo({ menuPrincipal.mainMenu() })
  }
}

object instruccionesText {
  method image() = "InstruccionesF.png"
  
  method position() = game.at(1,2)
}
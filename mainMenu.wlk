import Objetos.*
object menuPrincipal {
    var fondo = "fondo.png"

  method mainMenu() {
    const sonido = game.sound("sonido.mp3")
    
    game.clear()
    game.boardGround(fondo)
    opcion1.initialize()
    opcion2.initialize()
    opcion3.initialize()
    game.addVisual(nombreJuego)
    game.addVisual(opcion1)
    game.addVisual(opcion2)
    game.addVisual(opcion3)
    keyboard.up().onPressDo({sonido.play()})
	keyboard.right().onPressDo({sonido.play()})
	keyboard.down().onPressDo({sonido.play()})
	keyboard.left().onPressDo({sonido.play()})
    game.addVisualCharacter(puntero)
  }
}

object nombreJuego {
    var property position = game.at(7,8)
    method image() = "logoGame.png"
}

object puntero {
    var property position = game.at(13,5)
    const image = "cursorTest.gif"
	

    method image() = image
   
}

class Opcion {
    var property imagen //posible imagen
    var position

}

object opcion1 inherits Opcion{
    
    method initialize(){
        position = game.at(17, 6)
        imagen = "jugar(2).png"
    }
    method position() = position
    method image() = imagen
}

object opcion2 inherits Opcion{
    
    method initialize(){
    imagen = "op2_580x137.png"
    position = game.at(17, 3)
    }
    method position() = position
    method image() = imagen
}

object opcion3 inherits Opcion{
    
    method initialize(){
    imagen = "o3.png"
    position = game.at(17, 1)
    }
    method position() = position
    method image() = imagen
}

object paletaColores {
  const property violeta = "4C2882"
}
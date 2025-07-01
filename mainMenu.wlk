import example.*
import objetos.*
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
    game.addVisual(puntero2)
    keyboard.w().onPressDo({puntero2.subir()})
    keyboard.s().onPressDo({puntero2.bajar()})
    
  }
}

object nombreJuego {
    var property position = game.at(7,8)
    method image() = "logoGame.png"
}

object puntero2 {
    
    var property position = game.at(13,6)
    const image = "cursorTest.gif"
    
    method image() = image
    method subir() { 
        if (position.y() == 0 || position.y() == 3) {
            position = position.up(3)
        }
    }
    method bajar() { 
        if (position.y() == 6 || position.y() == 3) {
            position = position.down(3)
        }
    }
    
}

class Opcion {
    var property imagen //posible imagen
    var position

    var property estaColisionando = false 
}

object opcion1 inherits Opcion{
    
    method initialize(){
        position = game.at(17, 7)
        imagen = "jugar(2).png"
    }
    method position() = position
    method image() = imagen
}

object opcion2 inherits Opcion{
    
    method initialize(){
    imagen = "op2_580x137.png"
    position = game.at(17, 4)
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


object pantallaSomos {
    method iniciar(){
        game.clear()
        game.addVisual(equipo)
        game.addVisual(indicador)
        keyboard.d().onPressDo({ indicador.moverDerecha() })
        keyboard.a().onPressDo({ indicador.moverIzquierda() })
        keyboard.num1().onPressDo({game.say(indicador, "Soy Nahuel y soy Chef Profesional")})
        keyboard.num2().onPressDo({game.say(indicador, "Soy Ariel y soy Chef Profesional")})
        keyboard.num3().onPressDo({game.say(indicador, "Soy Laura y soy Chef Profesional")})
        keyboard.num4().onPressDo({game.say(indicador, "Soy Cristian y soy Chef Profesional")})

    }
}


object equipo {
    var property position = game.at(0,0)
    method image() = "prueba.png"
}

object indicador {
    var property image = "arrow.png"
    var property position = game.at(2,2)
    var property texto = 0

    method moverDerecha(){
        if(position.x() < 24){
        position = position.right(8)
        }
    }
    method moverIzquierda(){
        if(position.x() > 2 )
        position = position.left(8)
    }
    
}




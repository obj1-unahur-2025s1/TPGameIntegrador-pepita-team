
import MainGame.*


object pantallaCarga{
    method iniciarPantallaCarga(){
        game.clear()
        game.boardGround("Mesa.png")
        game.addVisual(jugar)
        game.addVisual(instrucciones)
        game.addVisual(about)
        keyboard.a().onPressDo({about.accion()})
        keyboard.j().onPressDo({jugar.accion()})
        keyboard.i().onPressDo({instrucciones.accion()})
        keyboard.m().onPressDo({self.iniciarPantallaCarga()})
    }
        
}


class Button{   
    var texto
    var property position
    method accion(){}
    const colorSelectionOn = 'B00000FF'
    const colorSelectionOff = 'B00000FF'            //Aca me gustaria agregar que cuando alguien hace alguna accion de seleccion de menu. Tenga un retardo de 0.5s y se retroilumine(cambiando el color del texto) lo seleccionado con game.scheulde o eso
    var color = colorSelectionOff
    method text() = texto

    method textColor() = color
    method onColision(){
        color = colorSelectionOn
    }
    method offColition(){
        color = colorSelectionOff
    }

}

object jugar inherits Button{
   method initialize(){
    texto = "Presiona J para jugar"
    position = game.at(4,3)
   }
   override method accion(){
    game.clear()
    keyboard.m().onPressDo({pantallaCarga.iniciarPantallaCarga()})
    juego.iniciar()
   }
    }

object instrucciones inherits Button{
   method initialize(){
    texto = "Presiona I para instrucciones"
    position = game.at(4,4)
   }

   override method accion(){
    game.clear()
    game.addVisual(imagenInstrucciones)
    keyboard.m().onPressDo({pantallaCarga.iniciarPantallaCarga()})
   }

    }

object about inherits Button{
   method initialize(){
    texto = "Presiona A para conocernos"
    position = game.at(4,5)
   }
   override method accion(){
    game.clear()
    game.addVisual("")
    keyboard.m().onPressDo({pantallaCarga.iniciarPantallaCarga()})
   }
    }


object imagenInstrucciones{
    var property position = game.at(1,2)            //Intente hacer que cambie de fondo cuando cambia el "escenario" pero hay que recargar la pagina. Asi que creo que es mas facil cargar una imagen como un elemento y listo
    var property image =  "ruele-game.jpg"
}
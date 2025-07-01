import Alimento.*
import MainGame.*


object pedidoArmado{
  var property ingredientes = []
  var property ultimoElemento =  null

  method agregarUltimoElemento(){
    game.addVisual(ingredientes.last())
  }

  method clean(){
    ingredientes.forEach({e=>self.eliminarUltimoIngrediente()})
  }

  method eliminarUltimoIngrediente(){
    game.removeVisual(ingredientes.last())
    ingredientes.remove(ingredientes.last())
    posicion.posicionY(posicion.posicionY() -1)
  }

  method agregarIngrediente(unIngrediente){
    ingredientes.add(unIngrediente)
    self.agregarUltimoElemento()
    }

  method llevarALaParrillaUltimoElemento(){
    ingredientes.last().cocinar()
  }

  method compararPedido(){
    var x = ingredientes.map({e=>e.ingrediente()})          //Comparo los strings de los pedidos POrque si comparo el elemento en si las instancias se llaman a Pan o a Carne y no me sirve
    return (x == orden.orden())
  }
}






//---------------------------------------------------Objetos de Muestra---------------------------------------------------------------//

object unPan inherits Pan {
  override method position() = game.at(1,2)
  method crearClon(){
     var nuevoPan 
     nuevoPan = new Pan()
     nuevoPan.initialize()
     posicion.usar()
    pedidoArmado.agregarIngrediente(nuevoPan)
  }


}

object unaCarne inherits Carne{

  override method position() = game.at(1,1)

  method crearClon(){
    var nuevaCarne
    nuevaCarne = new Carne()
    nuevaCarne.initialize()
    posicion.usar()
  pedidoArmado.agregarIngrediente(nuevaCarne)
  }
}






















//
/*
    Uso posiciones globales asi todas las nuevas instancias tienen acceso a la informacion en general de donde esta la poscion en la cual pueden agregarse
    y quedar lindante al ultimo elemento agregado
*/
object posicion{
  var property posicionX = 3
  var property posicionY = 5
  method usar(){
    posicionY = posicionY + 1
  }

  var property posicionParrillaX = 6
  var property posicionParrillaY = 0   
  method usarParrilla(){
    posicionParrillaX = posicionParrillaX + 1
  }
  method dejarDeUsarParrilla(){
    posicionParrillaX = posicionParrillaX - 1
  }
}


object orden{
    const property ingredientes = ["Tomate", "Lechuga", "Cebolla", "Mayonesa", "Ketchup", "Cheddar", "Bacon", "Paty de Lenteja", "Carne"]

    var property orden = []
    const armador = [1,2,3,4]
    method numeroRandom() = 0.randomUpTo(ingredientes.size()).truncate(0)
    method newOrden(){
      orden.clear()
      orden.add("Pan")
      armador.forEach({e=>orden.add(ingredientes.get(self.numeroRandom()))})
      orden.add("Pan")
    }


}

object ordenAmostrar{

  var property position = game.at(4,9)
  method text() = orden.orden().toString()
}



object puntaje {
  var property position = game.at(0,8)
  var property puntos = 0
  method text() = "P:" + puntos

}
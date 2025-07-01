object juego{
  method iniciar(){
    game.addVisual(unPan) 
    game.addVisual(unaCarne)
    game.addVisualCharacter(puntero)
    keyboard.t().onPressDo({self.metodo()})
    keyboard.k().onPressDo({puntero.dejarElemento()})
  }


 method metodo(){
  game.onCollideDo(puntero,{e=>e.llevarseUnPan()})
 }

}


object pedidoArmado{
  var property ingredientes = []


  method agregarAlimentos()= ingredientes.forEach({e=>game.addVisual(e)})
  method agregarIngrediente(unIngrediente){ingredientes.add(unIngrediente)}


}


object puntero{


  var property mochila = null
  var imagen = "circle.png"
  method image() = imagen
  var property position = game.center()



  method dejarElemento() {
    mochila.position(self.position())
    game.addVisual(mochila)
    pedidoArmado.ingredientes.add(mochila)
    self.vaciarMochila()
  }


  method vaciarMochila(){
    mochila = null
  }
}


object unPan inherits Pan {
  override method position() = game.at(1,2)
  method crearClon(){
     var nuevoPan 
     nuevoPan = new Pan()
     nuevoPan.initialize()
     posicion.usar()
    pedidoArmado.agregarIngrediente(nuevoPan)
  }

  method llevarseUnPan(){
    var otroPan
    otroPan = new Pan()
    otroPan.initialize()
    puntero.mochila(otroPan)
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

class Alimento{
  var calorias 
  var image
  var property position = null

  var estaCrudo = true
  method cocinar(){estaCrudo = false}
  method image() = image
  method position() = position
  
}

class Pan inherits Alimento{

  method initialize(){
    calorias = 100
    image = "pan.png"
    //position = game.at(posicion.posicionX(),posicion.posicionY())
  }


  method comoHablaUnPan()= "Soy un pan"

}


class Carne inherits Alimento{

  method initialize(){
    calorias = 250
    image = "carne.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }

  override method cocinar(){
    super()
    calorias += 100
  }
}


object posicion{
  var property posicionX = 3
  var property posicionY = 5
  method usar(){
    posicionX =+ 1
  }
}
import Alimento.*
import MainGame.*


object pedidoArmado{
  var property ingredientes = []
  var property ultimoElemento =  null
  var property ingredientesLetras = []

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
    ingredientesLetras = ingredientes.map({e=>e.ingrediente()})          //Comparo los strings de los pedidos POrque si comparo el elemento en si las instancias se llaman a Pan o a Carne y no me sirve
    return (ingredientesLetras == orden.orden())
  }
}






//---------------------------------------------------Objetos de Muestra---------------------------------------------------------------//

object unPanAbajo inherits PanAbajo {
  override method position() = game.at(0,2)
  method crearClon(){
     var nuevoPanAbajo 
     nuevoPanAbajo = new PanAbajo()
     nuevoPanAbajo.initialize()
     posicion.usar()
    pedidoArmado.agregarIngrediente(nuevoPanAbajo)
  }


}

object unPanArriba inherits PanArriba{
  override method position() = game.at(1,2)
  method crearClon(){
     var nuevoPanArriba
     nuevoPanArriba = new PanArriba()
     nuevoPanArriba.initialize()
     posicion.usar()
     pedidoArmado.agregarIngrediente(nuevoPanArriba)
  }


}


object unaCarne inherits Carne{
  override method position() = game.at(2,2)

  method crearClon(){
    var nuevaCarne
    nuevaCarne = new Carne()
    nuevaCarne.initialize()
    posicion.usar()
  pedidoArmado.agregarIngrediente(nuevaCarne)
  }
}

object unBacon inherits Bacon{

  
  override method image() = "BaconCrudoF.png"
    

  override method position() = game.at(3,2)
  
  method crearClon(){
    var nuevoBacon
    nuevoBacon = new Bacon()
    nuevoBacon.initialize()
    posicion.usar()
  pedidoArmado.agregarIngrediente(nuevoBacon)
  }
}

object unTomate inherits Tomate{

  override method position() = game.at(0,1)

  method crearClon(){
    var nuevoTomate
    nuevoTomate = new Tomate()
    nuevoTomate.initialize()
    posicion.usar()
    pedidoArmado.agregarIngrediente(nuevoTomate)
  }
}
object unaLechuga inherits Lechuga{

  override method position() = game.at(1,1)

  method crearClon(){
    var nuevaLechuga
    nuevaLechuga = new Lechuga()
    nuevaLechuga.initialize()
    posicion.usar()
    pedidoArmado.agregarIngrediente(nuevaLechuga)
  }
}
object unaCebolla inherits Cebolla{

  override method position() = game.at(2,1)

  method crearClon(){
    var nuevaCebolla
    nuevaCebolla = new Cebolla()
    nuevaCebolla.initialize()
    posicion.usar()
    pedidoArmado.agregarIngrediente(nuevaCebolla)
  }
}
object unFrascoDeMayonesa inherits Mayonesa{

  override method image() = "Frasco_de_mayonesaF.png"
  override method position() = game.at(3,1)

  method crearClon(){
    var nuevoFrascoDeMayonsa
    nuevoFrascoDeMayonsa = new Mayonesa()
    nuevoFrascoDeMayonsa.initialize()
    posicion.usar()
    pedidoArmado.agregarIngrediente(nuevoFrascoDeMayonsa)
  }
}

object unFrascoDeKechup inherits Ketchup{
  override method image() = "Botella_de_ketchupF.png"
  override method position() = game.at(0,0)

  method crearClon(){
    var nuevoFrascoDeKetchup
    nuevoFrascoDeKetchup = new Ketchup()
    nuevoFrascoDeKetchup.initialize()
    posicion.usar()
  pedidoArmado.agregarIngrediente(nuevoFrascoDeKetchup)
  }
}

object unPatyDeLenteja inherits Patylenteja{

  override method position() = game.at(1,0)

  method crearClon(){
    var nuevoPatyDeLenteja 
    nuevoPatyDeLenteja = new Patylenteja()
    nuevoPatyDeLenteja.initialize()
    posicion.usar()
  pedidoArmado.agregarIngrediente(nuevoPatyDeLenteja)
  }
}
object unCheddar inherits Cheddar{
  override method image() = "CheddarCrudoF.png"
  override method position() = game.at(2,0)

  method crearClon(){
    var nuevoCheddar
    nuevoCheddar = new Cheddar()
    nuevoCheddar.initialize()
    posicion.usar()
  pedidoArmado.agregarIngrediente(nuevoCheddar)
  }
}
















/*
    Uso posiciones globales asi todas las nuevas instancias tienen acceso a la informacion en general de donde esta la poscion en la cual pueden agregarse
    y quedar lindante al ultimo elemento agregado
*/
object posicion{
  var property posicionX = 5
  var property posicionY = 3
  method usar(){
    posicionY = posicionY + 1
  }

  var property posicionParrillaX = 6
  var property posicionParrillaY = 1  
  method usarParrilla(){
    posicionParrillaX = posicionParrillaX + 1
  }
  method dejarDeUsarParrilla(){
    posicionParrillaX = posicionParrillaX - 1
  }

  var property posicionXMostrar = 8
  var property posicionYMostrar = 3
  method usarMostrar(){
    posicionYMostrar = posicionYMostrar + 1
  }
  method reinicarPosicionesDeOrden(){
    posicionYMostrar = 3
  }
}


object orden{
    const property ingredientes = ["Tomate", "Lechuga", "Cebolla", "Mayonesa", "Ketchup", "Cheddar", "Bacon", "Paty de Lenteja", "Carne"]

    var property orden = []
    const armador = [1,2,3,4]
    method numeroRandom() = 0.randomUpTo(ingredientes.size()).truncate(0)
    method newOrden(){
      creadorPalabra.limpiarPantalla()
      orden.clear()
      orden.add("Pan Abajo")
      armador.forEach({e=>orden.add(ingredientes.get(self.numeroRandom()))})
      orden.add("Pan Arriba")
      ordenAmostrar.mostrarPalabras()
      posicion.reinicarPosicionesDeOrden()
    }


}

object ordenAmostrar{

  var property position = game.at(4,9)

  var property palabrasMostradas = []

  method mostrarPalabras(){
    orden.orden().forEach({e=>
      creadorPalabra.crearOrden(e)
      posicion.usarMostrar()
      palabrasMostradas.add(e)
    })
  }

}



object puntaje {
  var property position = game.at(0,8)
  var property puntos = 0
  method puntos() = puntos
  method setPuntosWin(){puntos = (puntos + 15).min(61) self.seleccionadorDePuntaje()}
  method setPuntosLose(){puntos = (puntos -15).max(0) self.seleccionadorDePuntaje()}
  var property image = "0.png"
  method reiniciarPuntaje(){
    puntos = 0
  }

  method seleccionadorDePuntaje(){
    if(puntos == 0){
      image = "0.png"
    }
    if(puntos == 15){
      image = "15.png"
    }
    if(puntos == 30){
      image = "30.png"
    }
    if(puntos == 45){
      image = "45.png"
    }
    if(puntos == 60){
      image = "60.png"
    }         
  }

}




object winMssg{
  var property position = game.at(2,2)
  var property image = "ImageWin.png"
}

object loseMssg{
  var property position = game.at(2,2)
  var property image = "ImageLose.png"
}


object temporizador{
  var property position = game.at(0,9)
  var property segundos = 60
  var property image = "Cronometroo.gif"

  method iniciar(){
    game.onTick(1000, "Cronometro", {
      segundos = (segundos - 1).max(0)
      })
  }

  method reiniciar(){
    segundos = 60
  }

  method reiniciarGif(){
    image = "circle.png"
    game.schedule(10, {
    image = "Cronometroo.gif"
  })
  }

}

//****************************************************************************************************

class Palabra{
  const property image  
  var property position
  
}

object creadorPalabra{

  var property palabras = []

  method limpiarPantalla(){
    palabras.forEach({
      e=>game.removeVisual(e)
    })
  }

  method crearOrden(string){
    if(string == "Tomate"){
      var palabraAgregar 
      palabraAgregar = new Palabra(image = "TomatePalabra150.png", position = game.at(posicion.posicionXMostrar(),posicion.posicionYMostrar()))
      game.addVisual(palabraAgregar)
      palabras.add(palabraAgregar)
    }

    if(string == "Lechuga") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "LechugaPalabra150.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
        palabras.add(palabraAgregar)
    }

    if(string == "Cebolla") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "CebollaPalabra150.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
        palabras.add(palabraAgregar)
    }

    if(string == "Mayonesa") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "MayonesaPalabra150.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
        palabras.add(palabraAgregar)
    }

    if(string == "Ketchup") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "KetchupPalabra150.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
        palabras.add(palabraAgregar)
    }

    if(string == "Cheddar") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "CheddarPalabra150.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
        palabras.add(palabraAgregar)
    }

    if(string == "Bacon") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "BaconPalabra150.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
        palabras.add(palabraAgregar)
    }

    if(string == "Paty de Lenteja") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "PatyDeLentejaPalabra150.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
        palabras.add(palabraAgregar)
    }

    if(string == "Carne") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "CarnePalabra150.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
        palabras.add(palabraAgregar)
    }
      if(string == "Pan Abajo") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "PanDeAbajoPalabra150.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
        palabras.add(palabraAgregar)
    }
      if(string == "Pan Arriba") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "PanDeArribaPalabra150.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
        palabras.add(palabraAgregar)
    }

    }
}



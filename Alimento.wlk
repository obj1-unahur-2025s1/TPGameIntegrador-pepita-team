import MainGame.*
import objetos.*

class Alimento{
  var calorias 
  var image
  var position

  var property estaColisionando = false   
  var estaCrudo = true
  method cocinar(){estaCrudo = false}
  method image() = image
  method position() = position
  
}


//      ["Tomate", "Lechuga", "Cebolla", "Mayonesa", "Ketchup", "Cheddar", "Bacon", "Paty de Lenteja", ]

class Pan inherits Alimento{

  method initialize(){
    calorias = 100
    image = "Pan_Arriba.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())   //Cuando se instancia un nuevo objeto se acomda encima de la ultima cosa agregada"
  }

  method ingrediente() = "Pan"

}


class Carne inherits Alimento{

  method initialize(){
    calorias = 250
    image = "carne.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }

  override method cocinar(){
    super()
    const posActual = puntero.position()
    calorias += 100
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "Carne50.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
    })
  }

  method ingrediente() = "Carne"
}


class Tomate inherits Alimento{

  method initialize(){
    calorias = 150
    image = "Tomatito.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }

  

}
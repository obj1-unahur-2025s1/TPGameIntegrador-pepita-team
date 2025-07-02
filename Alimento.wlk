import MainGame.*
import objetos.*

class Alimento{
  var calorias 
  var image
  var position

  var property estaEnLaParrilla = false
  var property estaColisionando = false   
  var property estaCrudo = true
  method cocinar(){estaCrudo = false}
  method image() = image
  method position() = position
}

/////////////////////////////////////////////////////// Alimentos
class PanArriba inherits Alimento{

  method initialize(){
    calorias = 100
    image = "Pan_ArribaF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())   //Cuando se instancia un nuevo objeto se acomda encima de la ultima cosa agregada"

  }
  method ingrediente() = "Pan Arriba"
}

class PanAbajo inherits Alimento{
  method initialize(){
    calorias = 100
    image = "PancitoDeAbajoF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())   //Cuando se instancia un nuevo objeto se acomda encima de la ultima cosa agregada"
  }
  method ingrediente() = "Pan Abajo"
}


class Carne inherits Alimento{
  method initialize(){
    calorias = 250
    image = "CarneCrudaPF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }
  override method cocinar(){
    self.estaEnLaParrilla(true)
    super()
    const posActual = puntero.position()
    calorias += 100
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "CarneCocidaF.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
        self.estaEnLaParrilla(false)
    })
  }
  method quemar(){
    const posActual = puntero.position()
    calorias += 500
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "CarboncitoF.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
    puntaje.setPuntosLose()
    })
  }
  method ingrediente() = "Carne"
}


class Tomate inherits Alimento{
  method initialize(){
    calorias = 150
    image = "TomatitoF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }
  method ingrediente() = "Tomate"
}


class Lechuga inherits Alimento{
method initialize(){
  calorias = 100
  image = "LechuguitaF.png"
  position = game.at(posicion.posicionX(),posicion.posicionY())
}
  method ingrediente() = "Lechuga"
}

class Cebolla inherits Alimento{
  method initialize(){
    calorias = 80
    image = "CebollitaF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }
  method ingrediente() = "Cebolla"
}

class Mayonesa inherits Alimento{
  method initialize(){
    calorias = 150
    image = "MayonesitaF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }
  method ingrediente() = "Mayonesa"
}

class Ketchup inherits Alimento(){
  method initialize(){
    calorias = 120
    image = "KetchupF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }
  method ingrediente()="Ketchup"
}


class Cheddar inherits Alimento(){
  method initialize(){
    calorias = 200
    image = "CheddarCrudoF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }
  override method cocinar(){
    self.estaEnLaParrilla(true)
    super()
    const posActual = puntero.position()
    calorias += 100
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "QuesitoF.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
        self.estaEnLaParrilla(false)
    })
  }
  method quemar(){
    const posActual = puntero.position()
    calorias += 500
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "CarboncitoF.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
    puntaje.setPuntosLose()
  })}

  method ingrediente() = "Cheddar"

} 

class Bacon inherits Alimento(){
  method initialize(){
    calorias = 250
    image = "BaconCrudoF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }
  override method cocinar(){
    self.estaEnLaParrilla(true)
    super()
    const posActual = puntero.position()
    calorias += 100
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "BaconF.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
        self.estaEnLaParrilla(false)
    })
  }
  method quemar(){
    const posActual = puntero.position()
    calorias += 500
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "CarboncitoF.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
    puntaje.setPuntosLose()
    })}
  method ingrediente() = "Bacon"
}


class Patylenteja inherits Alimento{
  method initialize(){
    calorias = 90
    image = "Hamburguesa_LentejaCrudaF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }
  override method cocinar(){
    self.estaEnLaParrilla(true)
  super()
  const posActual = puntero.position()
  calorias += 100
  position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
  posicion.usarParrilla()
  game.schedule(5000, {
      image = "Hamburguesa_de_lentejasF.png"
      position = posActual
      posicion.dejarDeUsarParrilla()
      self.estaEnLaParrilla(false)
  })}

  method quemar(){
  const posActual = puntero.position()
  calorias += 500
  position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
  posicion.usarParrilla()
  game.schedule(5000, {
      image = "CarboncitoF.png"
      position = posActual
      posicion.dejarDeUsarParrilla()
  puntaje.setPuntosLose()
  })}
  method ingrediente() = "Paty de Lenteja"
}
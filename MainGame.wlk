import Alimento.*
import Objetos.*

object juego{
  method iniciar(){

    game.addVisual(unPan) 
    game.addVisual(unaCarne)
    game.addVisualCharacter(puntero)
    orden.newOrden()
    game.addVisual(ordenAmostrar)
    game.addVisual(puntaje)
    game.onCollideDo(puntero, {                                             //cada vez que colisiona con algo, le cambia el estado interno a algo a true y al puntero le digo quien es algo para que luego verifique que sea != de null
        i=>i.estaColisionando(true)
        puntero.ultimoColisionado(i)
        game.schedule(750,{i.estaColisionando(false)})                     //Aca lo hice medio "Con alambre" porque no hay una forma de cambiar el estado interno de estaColisionando a false cuanso se separa, asi que despues de 1.5s lo cambio automaticamente
        })
    keyboard.k().onPressDo({pedidoArmado.eliminarUltimoIngrediente()})
    keyboard.t().onPressDo({self.hacerClon()})                                 //Llama al metodo hacerClon para que cuando toco la T verifique que esta colisionanso con eso mismo y lo clona
    keyboard.x().onPressDo({console.println(pedidoArmado.ingredientes())})  //Verificaicon por consola de la lista de productos que se va armando
    keyboard.enter().onPressDo({puntero.ganar()})                           //Llama a verificar si esta bien loq ue armamos
    keyboard.c().onPressDo({self.cocinar()})
  }
    

    method hacerClon(){
         var objetivo = puntero.ultimoColisionado()
         if (objetivo !== null && objetivo.estaColisionando()) {
            objetivo.crearClon()
        }
    }

    method cocinar() {
       var objetivo = puntero.ultimoColisionado()
         if (objetivo !== null && objetivo.estaColisionando()) {
            objetivo.cocinar()
        }
    }
}




object puntero{


  var property ultimoColisionado = null         //Esto me ayuda a verificar que solo cuando algo esta colisionando y al mismo timepo estoy tocanso la tecla de accion se cree una nueva instancia
  var imagen = "circle.png"
  method image() = imagen
  var property position = game.center()

  method ganar() = 
    if(pedidoArmado.compararPedido())
    {
      puntaje.puntos(puntaje.puntos() + 15)
      game.say(self,"Ganaste")
      pedidoArmado.clean()
      orden.newOrden()
      console.println(puntaje.puntos())

    } 
    else
    {
      puntaje.puntos((puntaje.puntos() - 15))
      game.say(self,"Perdiste")
      console.println(puntaje.puntos())
    }


}





import mainMenu.*
import Alimento.*
import objetos.*

object juego{
  const sonidoBoton = new Sonido(sonido = "salto.mp3")
  const boton = new Sonido(sonido = "sound1.mp3")
 
  method iniciar(){
    puntaje.seleccionadorDePuntaje()
    console.println(puntaje.puntos())
    game.addVisual(temporizador)
    temporizador.reiniciar()
    temporizador.iniciar()
    game.addVisualCharacter(puntero)
    keyboard.up().onPressDo({boton.reproducir()})
	  keyboard.down().onPressDo({boton.reproducir()})
	  keyboard.left().onPressDo({boton.reproducir()})
	  keyboard.right().onPressDo({boton.reproducir()})    
    
    orden.newOrden()
    console.println(orden.orden())
    self.agregarObjetosMuestra()
    game.addVisual(puntaje)
    game.onCollideDo(puntero, {                                             //cada vez que colisiona con algo, le cambia el estado interno a algo a true y al puntero le digo quien es algo para que luego verifique que sea != de null
        i=>i.estaColisionando(true)
        puntero.ultimoColisionado(i)
        game.schedule(750,{i.estaColisionando(false)})                     //Aca lo hice medio "Con alambre" porque no hay una forma de cambiar el estado interno de estaColisionando a false cuanso se separa, asi que despues de 1.5s lo cambio automaticamente
        })
    self.elementosTeclado()
    game.onTick(1000, "VerificarWin", {self.finDelJuego()})
  }
    

    method hacerClon(){
         var objetivo = puntero.ultimoColisionado()
         if (objetivo !== null && objetivo.estaColisionando()) {
            objetivo.crearClon()
        }
    }

    method cocinar() {
       var objetivo = puntero.ultimoColisionado()
         if (objetivo !== null && objetivo.estaColisionando() && objetivo.estaCrudo() && !objetivo.estaEnLaParrilla()) {
            objetivo.cocinar()}

         if((!objetivo.estaCrudo()) && objetivo !== null && objetivo.estaColisionando() && !objetivo.estaEnLaParrilla()){
           objetivo.quemar()
         }
    }


    method ganar(){
      if(self.evaluarJuego()){
        game.clear()
        const sonidoWin = game.sound("VictoriaSound.mp3")
        sonidoWin.play()
        game.removeTickEvent("VerificarWin")
        game.addVisual(winMssg)
        keyboard.m().onPressDo({menuPrincipal.mainMenu()})
        keyboard.q().onPressDo({self.iniciar()})
        game.schedule(1000, {puntaje.reiniciarPuntaje()})
      }}

    method evaluarJuego()= (puntaje.puntos() == 60)


    method perder(){
      if(!self.evaluarJuego()){
        game.clear()
        const sonidoLose = game.sound("loseGame.mp3")
        sonidoLose.play()
        game.removeTickEvent("VerificarWin")
        game.removeTickEvent("Cronometro")
        game.addVisual(loseMssg)
        keyboard.m().onPressDo({ menuPrincipal.mainMenu() })
        game.schedule(1000, {puntaje.reiniciarPuntaje()})
      }
    }

    method finDelJuego(){
      if(temporizador.segundos() == 0 || puntaje.puntos() >= 60){
        self.ganar()
        self.perder()
      }
    }

    method agregarObjetosMuestra(){
      game.addVisual(unPanArriba)
      game.addVisual(unPanAbajo) 
      game.addVisual(unaCarne)
      game.addVisual(ordenAmostrar)
      game.addVisual(unBacon)
      game.addVisual(unTomate)
      game.addVisual(unaLechuga)
      game.addVisual(unaCebolla)
      game.addVisual(unFrascoDeMayonesa)
      game.addVisual(unFrascoDeKechup)
      game.addVisual(unPatyDeLenteja)
      game.addVisual(unCheddar)
    }

    method elementosTeclado(){
      keyboard.k().onPressDo({pedidoArmado.eliminarUltimoIngrediente() sonidoBoton.reproducir()})
      keyboard.t().onPressDo({self.hacerClon() sonidoBoton.reproducir()})                                 //Llama al metodo hacerClon para que cuando toco la T verifique que esta colisionanso con eso mismo y lo clona
      keyboard.x().onPressDo({console.println(pedidoArmado.ingredientes()) sonidoBoton.reproducir()})  //Verificaicon por consola de la lista de productos que se va armando
      keyboard.enter().onPressDo({puntero.ganar() sonidoBoton.reproducir()})                           //Llama a verificar si esta bien loq ue armamos
      keyboard.c().onPressDo({self.cocinar() sonidoBoton.reproducir()})
      keyboard.backspace().onPressDo({puntaje.setPuntosWin() sonidoBoton.reproducir()})
      keyboard.m().onPressDo({ menuPrincipal.mainMenu() sonidoBoton.reproducir()})
    }

}




object puntero{
  var property ultimoColisionado = null         //Esto me ayuda a verificar que solo cuando algo esta colisionando y al mismo timepo estoy tocanso la tecla de accion se cree una nueva instancia
  var imagen = "circleF.png"
  method image() = imagen
  var property position = game.center()
  method ganar() = 
    if(pedidoArmado.compararPedido())
    {
      puntaje.setPuntosWin()
      game.say(self,"Pedido exitoso")
      pedidoArmado.clean()
      orden.newOrden()
    } 
    else
    {
      puntaje.setPuntosLose()
      game.say(self,"Pedido erroneo")
    }
}





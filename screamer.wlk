import wollok.game.*
import juego2.*
import general.*

object partida3 inherits Partida(
  siguientePartida = fin,
  imagenPared = "pared-tierra.png",
  personaje = lauti,
  imagenManzana = "imagenManzana",
  objetivoManzanas = 1,
  manzanasEnMapa = [],
  paredes = [],
  //ESTE MAPA YA ESTA BIEN
  matrizParedes =[
    [ n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pr, pr, pr,  n,  n,  n,  n,  n],  // fila 17
    [ n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pr, mn, pr,  n,  n,  n,  n,  n],  // fila 16
    [ n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pr,  n, pr,  n,  n,  n,  n,  n],  // fila 15
    [ n,  n,  n,  n,  n,  n,  n,  n, pr, pr, pr,  n, pr,  n,  n,  n,  n,  n],  // fila 14
    [ n,  n,  n,  n,  n,  n, pr, pr, pr,  n,  n,  n, pr,  n,  n,  n,  n,  n],  // fila 13
    [ n,  n,  n,  n,  n,  n, pr,  n,  n,  n, pr, pr, pr,  n,  n,  n,  n,  n],  // fila 12
    [ n, pr, pr, pr, pr, pr, pr,  n, pr, pr, pr,  n,  n,  n,  n,  n,  n,  n],  // fila 11
    [ n, pr,  n,  n,  n, pr, pr,  n, pr,  n,  n,  n,  n,  n,  n,  n,  n,  n],  // fila 10
    [ n, pr,  n, pr,  n, pr, pr,  n, pr,  n,  n,  n,  n,  n,  n,  n,  n,  n],  // fila 9
    [ n, pr,  n, pr,  n, pr, pr,  n, pr, pr, pr, pr, pr, pr, pr, pr, pr,  n],  // fila 8
    [ n, pr,  n, pr,  n,  n,  n,  n, pr, pr,  n,  n,  n,  n,  n,  n, pr,  n],  // fila 7
    [ n, pr,  n, pr, pr, pr, pr, pr, pr, pr,  n, pr, pr, pr, pr,  n, pr, pr],  // fila 6
    [ n, pr,  n,  n,  n,  n,  n,  n,  n,  n,  n, pr,  n,  n, pr,  n,  n, pr],  // fila 5
    [ n, pr, pr, pr, pr, pr, pr, pr, pr, pr, pr, pr,  n,  n, pr, pr,  n, pr],  // fila 4
    [ n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pr,  n,  n, pr],  // fila 3
    [pr, pr, pr, pr, pr, pr, pr, pr, pr, pr, pr, pr, pr, pr, pr,  n, pr, pr],  // fila 2
    [pr,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pr, pr],  // fila 1
    [pr, pr, pr, pr, pr, pr, pr, pr, pr, pr, pr, pr, pr, pr, pr, pr, pr, pr]],
    manzanasActuales = 0){

      override method iniciar() {
          super()
          reloj.iniciar()
          game.onTick(1000, "reloj", { reloj.restar() })
      }

      method finalizarParedes() {
        self.paredes().forEach({pared => pared.finalizar()})
        self.paredes().clear()
      }
    }

object lauti inherits Personaje(posicionInicial = game.at(1,1)) {

  override method moverCuerpos(posicionAnteriorCabeza){}

  override method interactuarManzana(manzanaScreamer) {
    //Poner Screamer
    screamer.iniciar()
    self.resetPosition()
  }

  method retornarCuerpos() = cuerpos
  
  method resetPosition() {
    position = posicionInicial
    reloj.segundos(20)
  }
  
  method interactuarPared() {
    self.resetPosition()
  }
  
  method cambiarImagen(x){
    imagen = x
    self.image()
  }
}

object screamer {
  var property position = game.at(9,9)
  method image() = "imagen.png"
  
  method iniciar() {
    game.addVisual(self)
    game.allVisuals().forEach({visual=> game.removeVisual(visual)})
    partida3.finalizarParedes()
  }

} 

object reloj inherits Cosas(x=3, y=14) {
  var property segundos = 20

  method image() = "reloj.png"

  method restar() {
    segundos-=1
    
    if(segundos==0){
      lauti.resetPosition()
      segundos = 20
    }
    
    game.say(self, "Tenes " + segundos + " segundos")
  }
}

/*
sonidoFondo.
 	


object lauti2 {
  
  var property posicionInicial = game.at(1,1)
  var property position = game.at(1,1)
  var property imagen = "cabeza-abajo.png"
  method image() = imagen
  
  method iniciar() {
    game.addVisualCharacter(self)
  }
  
  method interactuarPared() {
    self.resetPosition()
  }
  
  method resetPosition() {
    position = game.at(1, 1)
  }
  
  method interactuarManzana(manzanaScreamer) {
    self.ponerScreamer()
  }
  
  method ponerScreamer() {
    screamer.iniciar()
    self.resetPosition()
  }
  
  method cambiarImagen(x){
    imagen = x
    self.image()
  }

  //Esto es necesario para el movimiento
  const cuerpos = [] //esta en la clase personaje
  method retornarCuerpos() = cuerpos
  var property posicionProximoCuerpo = position //esta en la clase personaje
  method moverCuerpos(posicionAnteriorCabeza){}
}
*/
import wollok.game.*
import juego2.*
import general.*

object partida3 inherits Partida(
  siguientePartida = screamer,
  imagenPared = "pared-tierra.png",
  personaje = lauti,
  imagenManzana = "manzana.png",
  objetivoManzanas = 1,
  manzanasEnMapa = [],
  //ESTE MAPA YA ESTA BIEN
  matrizVisuales =[
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
        game.onTick(500, "reloj", { reloj.restar() })
    }
}

object lauti inherits Personaje(posicionInicial = game.at(1,1)) {

  override method moverCuerpos(posicionAnteriorCabeza){}

  override method reiniciarPersonaje() {
    self.position(posicionInicial)
    self.imagenAbajo()
    reloj.segundos(20)
  }
}

object reloj inherits Cosas(x=3, y=14) {
  var property segundos = 200

  method image() = "reloj.png"

  method restar() {
    segundos-=1
    
    if(segundos==0){
      lauti.reiniciarPersonaje()
      segundos = 20
    }
    
    game.say(self, "Tenes " + segundos + " segundos")
  }
}

object screamer {
  var property position = game.at(0,0)
  method image() = "fondo-flores.png"
  method reiniciarPersonaje() {}
  method iniciar() {
    game.allVisuals().forEach({visual=> game.removeVisual(visual)})
    game.addVisual(self)
  }
} 
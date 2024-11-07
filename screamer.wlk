import wollok.game.*
import juego2.*
import general.*


const partida3 = new Partida(
  siguientePartida = fin,
  imagenPared = "pared-tierra.png",
  personaje = lauti,
  imagenManzana = "imagenManzana",
  objetivoManzanas = 1,
  manzanasEnMapa = [],
  paredes = [],

    //Matriz del mapa completo de 20x20 delimitado por paredes que no hacen nada
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
      manzanasActuales = 0)

object lauti {
  
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
  const cuerpos = []
  method retornarCuerpos() = cuerpos
  var property posicionProximoCuerpo = position
  method moverCuerpos(posicionAnteriorCabeza)
    {
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



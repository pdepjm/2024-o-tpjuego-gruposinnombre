import wollok.game.*
import juego2.*
import general.*


const partida3 = new Partida(
  siguientePartida = fin,
  imagenPared = "imagenParedxD",
  personaje = lauti,
  imagenManzana = "imagenManzana",
  objetivoManzanas = 10,
  manzanasEnMapa = [],
  paredes = [],

    //Matriz del mapa completo de 20x20 delimitado por paredes que no hacen nada
    //ESTE MAPA YA ESTA BIEN
     matrizParedes = [
      [ n,  n,  n,  n,  n,  n,  n,  n,  n, pn,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n],
      [ n,  n,  n,  n,  n,  n,  n,  n,  n, pn,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n], // Fila 18
      [ n,  n,  n,  n, pn, pn, pn,  n,  n, pn,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n], // Fila 17
      [ n,  n,  n, pn,  n,  n,  n, pn,  n, pn,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n], // Fila 16
      [ n,  n, pn,  n,  n, pn,  n,  n, pn, pn,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n], // Fila 15
      [ n, pn,  n,  n, pn, pn, pn,  n,  n,  n,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n], // Fila 14
      [ n, pn,  n, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn], // Fila 13
      [ n, pn,  n,  n, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn], // Fila 12
      [ n, pn, pn,  n, pn, pn,  n, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn,  n, pn], // Fila 11
      [ n, pn, pn,  n,  n,  n,  n, pn,  n,  n,  n,  n, pn,  n,  n,  n, pn,  n,  n, pn], // Fila 10
      [ n, pn, pn, pn, pn,  n,  n, pn,  n,  n,  n,  n, pn,  n, pn,  n,  n,  n, pn, pn], // Fila 9
      [ n, pn, pn, pn, pn, pn, pn, pn,  n,  n,  n,  n, pn,  n, pn, pn, pn, pn, pn, pn], // Fila 8
      [ n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn,  n, pn, pn, pn, pn, pn, pn], // Fila 7
      [ n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn,  n,  n,  n,  n,  n, pn, pn], // Fila 6
      [ n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn, pn, pn, pn,  n,  n, pn], // Fila 5
      [ n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n, pn], // Fila 4
      [ n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn,  n,  n, pn], // Fila 3
      [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn,  n, pn, pn], // Fila 2
      [ n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn], // Fila 1
      [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn]],
      manzanasActuales = 0)
const manzanaScreamer = new Manzana(x = 10, y = 19, imagen = "b.png")

object lauti {
  
  var property position = game.at(1,1)
  var property imagen = "a.png"
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

  method moverse(direccion) {
    if (direccion == "derecha") {
      position = game.at(position.x() + 1, position.y())
      self.cambiarImagen("a.png")
      


    } else {
      if (direccion == "izquierda") {
        position = game.at(position.x() - 1, position.y())
        self.cambiarImagen("algo")
        


      } else {
        if (direccion == "arriba") {
          position = game.at(position.x(), position.y() + 1)
        } 
        
        
        
        else {
          if (direccion == "abajo") {
            position = game.at(position.x(), position.y() - 1)
          }
        }
      }
    }
  }
}

object screamer {
  var property position = game.at(9,9)
  method image() = "imagen.png"
  
  method iniciar() {
    game.addVisual(self)
    game.removeVisual(lauti)
    game.removeVisual(manzanaScreamer)
    partida3.finalizarParedes()
  }

} 



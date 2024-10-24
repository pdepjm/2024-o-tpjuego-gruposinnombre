import wollok.game.*
import juego2.*
import general.*


const partida1 = new Partida(siguientePartida = fin, imagenPartida = "imagen", imagenPared = "imagenParedxD", personaje = lauti, imagenManzana = "imagenManzana", objetivoManzanas = 10, 
manzanasEnMapa = [], paredes = [],
matrizParedes = [
        [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn],  // fila 0
        [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn],  // fila 1
        [pn, pn,  n,  n, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn, mn,  n, pn, pn],  // fila 2
        [pn, pn,  n, mn, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n,  n, pn, pn],  // fila 3
        [pn, pn,  n,  n, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n, pn, pn, pn],  // fila 4
        [pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n, pn, pn, pn],  // fila 5
        [pn, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n, mn, pn, pn],  // fila 6
        [pn, pn, pn, pn,  n,  n,  n,  n,  n,  n, pn, pn, pn, pn, pn, pn, mn,  n, pn, pn],  // fila 7
        [pn, pn, mn,  n,  n,  n,  n,  n,  n,  n, pn, pn, pn, pn, pn, pn, pn,  n, pn, pn],  // fila 8
        [pn, pn,  n,  n, pn,  n,  n,  n,  n,  n, pn, pn, pn, pn, pn, pn, pn,  n, pn, pn],  // fila 9
        [pn, pn,  n,  n, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 10
        [pn, pn,  n,  n, mn, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 11
        [pn, pn,  n,  n,  n, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 12
        [pn, pn, pn, pn,  n, pn, pn, pn, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 13
        [pn, pn, pn, pn, mn, pn, pn, pn, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 14
        [pn, pn, pn,  n,  n,  n,  n,  n,  n, pn, pn,  n,  n,  n, pn, pn, pn, pn, pn, pn],  // fila 15
        [pn, pn,  n,  n,  n, pn, pn,  n,  n, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 16
        [pn, pn,  n,  n, mn, pn, pn,  n, mn, pn, pn,  n,  n,  n,  n,  n,  n, mn, pn, pn],  // fila 17
        [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn],  // fila 18
        [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn] 
])
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



import wollok.game.*
import juego3.*
import general.*


object partida4
{ 
  //MAPA -----------------------------------------------------------------------------------------------
  const pisos = [
  new Pared(x = 0, y = 0, imagen = "image3.png"),
  new Pared(x = 1, y = 0, imagen = "image3.png"),
  new Pared(x = 2, y = 0, imagen = "image3.png"),
  new Pared(x = 3, y = 0, imagen = "image3.png"),
  new Pared(x = 4, y = 0, imagen = "image3.png"),
  new Pared(x = 5, y = 0, imagen = "image3.png"),
  new Pared(x = 6, y = 0, imagen = "image3.png"),
  new Pared(x = 7, y = 0, imagen = "image3.png"),
  new Pared(x = 8, y = 0, imagen = "image3.png"),
  new Pared(x = 9, y = 0, imagen = "image3.png"),
  new Pared(x = 10, y = 0, imagen = "image3.png"),
  new Pared(x = 11, y = 0, imagen = "image3.png"),
  new Pared(x = 12, y = 0, imagen = "image3.png"),
  new Pared(x = 13, y = 0, imagen = "image3.png"),
  new Pared(x = 14, y = 0, imagen = "image3.png"),
  new Pared(x = 15, y = 0, imagen = "image3.png"),
  new Pared(x = 16, y = 0, imagen = "image3.png"),
  new Pared(x = 17, y = 0, imagen = "image3.png"),
  new Pared(x = 18, y = 0, imagen = "image3.png"),
  new Pared(x = 19, y = 0, imagen = "image3.png"),
  new Pared(x = 0, y = 2, imagen = "image3.png"),
  new Pared(x = 1, y = 2, imagen = "image3.png"),
  new Pared(x = 2, y = 2, imagen = "image3.png"),
  new Pared(x = 3, y = 2, imagen = "image3.png"),
  new Pared(x = 4, y = 2, imagen = "image3.png"),
  new Pared(x = 5, y = 2, imagen = "image3.png"),
  new Pared(x = 6, y = 2, imagen = "image3.png"),
  new Pared(x = 7, y = 2, imagen = "image3.png"),
  new Pared(x = 8, y = 2, imagen = "image3.png"),
  new Pared(x = 9, y = 2, imagen = "image3.png"),
  new Pared(x = 10, y = 2, imagen = "image3.png"),
  new Pared(x = 11, y = 2, imagen = "image3.png"),
  new Pared(x = 12, y = 2, imagen = "image3.png"),
  new Pared(x = 13, y = 2, imagen = "image3.png"),
  new Pared(x = 14, y = 2, imagen = "image3.png"),
  new Pared(x = 15, y = 2, imagen = "image3.png"),
  new Pared(x = 16, y = 2, imagen = "image3.png"),
  new Pared(x = 12, y = 5, imagen = "image3.png"),
  new Pared(x = 13, y = 5, imagen = "image3.png"),
  new Pared(x = 14, y = 5, imagen = "image3.png"),
  new Pared(x = 15, y = 5, imagen = "image3.png"),
  new Pared(x = 16, y = 5, imagen = "image3.png"),
  new Pared(x = 19, y = 5, imagen = "image3.png"),
  new Pared(x = 14, y = 7, imagen = "image3.png"),
  new Pared(x = 15, y = 7, imagen = "image3.png"),
  new Pared(x = 16, y = 7, imagen = "image3.png"),
  new Pared(x = 17, y = 7, imagen = "image3.png"),
  new Pared(x = 18, y = 7, imagen = "image3.png"),
  new Pared(x = 15, y = 8, imagen = "image3.png"),
  new Pared(x = 16, y = 8, imagen = "image3.png"),
  new Pared(x = 17, y = 8, imagen = "image3.png"),
  new Pared(x = 18, y = 8, imagen = "image3.png"),
  new Pared(x = 19, y = 8, imagen = "image3.png"),
  new Pared(x = 15, y = 11, imagen = "image3.png"),
  new Pared(x = 16, y = 11, imagen = "image3.png"),
  new Pared(x = 17, y = 11, imagen = "image3.png"),
  new Pared(x = 19, y = 11, imagen = "image3.png"),
  new Pared(x = 14, y = 11, imagen = "image3.png"),
  new Pared(x = 13, y = 11, imagen = "image3.png"),
  new Pared(x = 12, y = 11, imagen = "image3.png"),
  new Pared(x = 11, y = 11, imagen = "image3.png"),
  new Pared(x = 10, y = 11, imagen = "image3.png"),
  new Pared(x = 9, y = 11, imagen = "image3.png"),
  new Pared(x = 8, y = 11, imagen = "image3.png"),
  new Pared(x = 7, y = 11, imagen = "image3.png"),
  new Pared(x = 7, y = 10, imagen = "image3.png"),
  new Pared(x = 18, y = 13, imagen = "image3.png"),
  new Pared(x = 16, y = 13, imagen = "image3.png"),
  new Pared(x = 15, y = 13, imagen = "image3.png"),
  new Pared(x = 14, y = 13, imagen = "image3.png"),
  new Pared(x = 13, y = 13, imagen = "image3.png"),
  new Pared(x = 12, y = 13, imagen = "image3.png"),
  new Pared(x = 11, y = 13, imagen = "image3.png"),
  new Pared(x = 10, y = 13, imagen = "image3.png"),
  new Pared(x = 9, y = 13, imagen = "image3.png"),
  new Pared(x = 8, y = 13, imagen = "image3.png"),
  new Pared(x = 7, y = 13, imagen = "image3.png"),
  new Pared(x = 6, y = 13, imagen = "image3.png"),
  new Pared(x = 5, y = 13, imagen = "image3.png"),
  new Pared(x = 4, y = 13, imagen = "image3.png"),
  new Pared(x = 3, y = 13, imagen = "image3.png"),
  new Pared(x = 1, y = 13, imagen = "image3.png"),
  new Pared(x = 1, y = 8, imagen = "image3.png"),
  new Pared(x = 2, y = 8, imagen = "image3.png"),
  new Pared(x = 3, y = 8, imagen = "image3.png"),
  new Pared(x = 4, y = 8, imagen = "image3.png"),
  new Pared(x = 5, y = 8, imagen = "image3.png"),
  new Pared(x = 6, y = 8, imagen = "image3.png"),
  new Pared(x = 7, y = 8, imagen = "image3.png")
  ]
//------------------------------------------------------------------------------------------
const columnas = [
  new Pared(x = 16, y = 3, imagen = "image3.png"),
  new Pared(x = 16, y = 4, imagen = "image3.png"),
  new Pared(x = 19, y = 1, imagen = "image3.png"),
  new Pared(x = 19, y = 2, imagen = "image3.png"),
  new Pared(x = 19, y = 3, imagen = "image3.png"),
  new Pared(x = 19, y = 4, imagen = "image3.png"),
  new Pared(x = 17, y = 4, imagen = "image3.png"),
  new Pared(x = 18, y = 2, imagen = "image3.png"),
  new Pared(x = 19, y = 6, imagen = "image3.png"),
  new Pared(x = 18, y = 6, imagen = "image3.png"),
  new Pared(x = 19, y = 7, imagen = "image3.png"),
  new Pared(x = 12, y = 6, imagen = "image3.png"),
  new Pared(x = 12, y = 7, imagen = "image3.png"),
  new Pared(x = 12, y = 8, imagen = "image3.png"),
  new Pared(x = 14, y = 8, imagen = "image3.png"),
  new Pared(x = 9, y = 19, imagen = "image3.png"),
  new Pared(x = 11, y = 19, imagen = "image3.png"),
  new Pared(x = 9, y = 18, imagen = "image3.png"),
  new Pared(x = 11, y = 18, imagen = "image3.png"),
  new Pared(x = 9, y = 17, imagen = "image3.png"),
  new Pared(x = 11, y = 17, imagen = "image3.png"),
  new Pared(x = 12, y = 10, imagen = "image3.png"),
  new Pared(x = 12, y = 9, imagen = "image3.png"),
  new Pared(x = 19, y = 10, imagen = "image3.png"),
  new Pared(x = 14, y = 9, imagen = "image3.png"),
  new Pared(x = 16, y = 10, imagen = "image3.png"),
  new Pared(x = 18, y = 9, imagen = "image3.png"),
  new Pared(x = 19, y = 13, imagen = "image3.png"),
  new Pared(x = 19, y = 12, imagen = "image3.png"),
  new Pared(x = 17, y = 13, imagen = "image3.png"),
  new Pared(x = 7, y = 9, imagen = "image3.png"),
  new Pared(x = 1, y = 10, imagen = "image3.png"),
  new Pared(x = 1, y = 11, imagen = "image3.png"),
  new Pared(x = 1, y = 12, imagen = "image3.png"),
  new Pared(x = 1, y = 9, imagen = "image3.png"),
  new Pared(x = 1, y = 14, imagen = "image3.png"),
  new Pared(x = 2, y = 15, imagen = "image3.png"),
  new Pared(x = 3, y = 16, imagen = "image3.png"),
  new Pared(x = 4, y = 17, imagen = "image3.png"),
  new Pared(x = 5, y = 17, imagen = "image3.png"),
  new Pared(x = 6, y = 17, imagen = "image3.png"),
  new Pared(x = 7, y = 16, imagen = "image3.png"),
  new Pared(x = 8, y = 15, imagen = "image3.png"),
  new Pared(x = 4, y = 14, imagen = "image3.png"),
  new Pared(x = 5, y = 14, imagen = "image3.png"),
  new Pared(x = 5, y = 15, imagen = "image3.png"),
  new Pared(x = 6, y = 14, imagen = "image3.png"),
  new Pared(x = 9, y = 15, imagen = "image3.png"),
  new Pared(x = 9, y = 16, imagen = "image3.png"),
  new Pared(x = 11, y = 16, imagen = "image3.png"),
  new Pared(x = 11, y = 15, imagen = "image3.png"),
  new Pared(x = 11, y = 14, imagen = "image3.png"),
  new Pared(x = 19, y = 9, imagen = "image3.png"),
  new Pared(x = 2, y = 9, imagen = "image3.png"),
  new Pared(x = 2, y = 10, imagen = "image3.png"),
  new Pared(x = 2, y = 11, imagen = "image3.png"),
  new Pared(x = 3, y = 9, imagen = "image3.png"),
  new Pared(x = 4, y = 9, imagen = "image3.png"),
  new Pared(x = 5, y = 11, imagen = "image3.png"),
  new Pared(x = 4, y = 11, imagen = "image3.png"),
  new Pared(x = 5, y = 12, imagen = "image3.png"),
  new Pared(x = 4, y = 12, imagen = "image3.png")
  ]

 method iniciarParedes() {
    pisos.foreach({ pared => pared.iniciar() })
    columnas.forEach({pared=>pared.iniciar()})
  }
  
  method finalizarParedes() {
    pisos.forEach({pared=>pared.finalizar()})
    columnas.forEach({pared=>pared.finalizar()})
  }
//MAPA -----------------------------------------------------------------------------------------------
  method personaje() = personaje

  method iniciar()
  {
    game.height(20)
    game.width(20)
    game.cellSize(50)
    game.ground("negrofondo.png")
    personaje.iniciar()
    manzanaScreamer.iniciar()
    self.iniciarParedes()
  }
}

const manzanaScreamer = new Manzana(x = 10, y = 19, imagen = "b.png")


object personaje {
  
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
    game.removeVisual(personaje)
    game.removeVisual(manzanaScreamer)
    partida4.finalizarParedes()
  }

} 



import wollok.game.*
import juego1.*
import juego3.*
import general.*

object partida2 {
  //TODO SOBRE PAREDES
  //Matriz del mapa completo de 20x20 delimitado por paredes que no hacen nada
    const matrizParedes = [
      [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn], // Fila 0
      [pn,  n,  n,  n, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn], // Fila 1
      [pn,  n, mn,  n, pn, pn,  n,  n,  n,  n,  n, pn,  n,  n,  n,  n,  n,  n, pn, pn], // Fila 2
      [pn, pn, pn,  n, pn, pn,  n, pn, pn, pn,  n, pn,  n, pn, pn,  n, mn,  n, pn, pn], // Fila 3
      [pn, pn, pn,  n, pn, pn,  n, pn, pn, pn,  n,  n, mn, pn, pn, mn, mn,  n, pn, pn], // Fila 4
      [pn, pn,  n,  n, pn, pn,  n, pn, pn, pn, pn, pn, pn, mn,  n, pn, pn,  n, pn, pn], // Fila 5
      [pn,  n,  n,  n,  n, pn,  n, pn, pn, pn, pn, pn, pn,  n,  n, pn, pn,  n, pn, pn], // Fila 6
      [pn, mn,  n,  n,  n, pn,  n,  n,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn], // Fila 7
      [pn, pn, pn, pn,  n, pn, pn, pn,  n,  n,  n, pn, pn, pn, pn, pn, pn, pn, pn, pn], // Fila 8
      [pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn, pn, pn, pn, pn, pn, pn, pn], // Fila 9
      [pn, pn,  n, pn, pn,  n, pn, pn,  n,  n,  n,  n,  n,  n, pn,  n,  n,  n, mn, pn], // Fila 10
      [pn, pn,  n,  n, mn,  n, pn, pn,  n,  n, pn, pn, pn,  n, pn,  n, pn, pn,  n, pn], // Fila 11
      [pn, pn, pn, pn, pn, pn, pn,  n,  n,  n,  n,  n, pn,  n,  n,  n, pn, pn,  n, pn], // Fila 12
      [pn, pn,  n,  n,  n,  n,  n,  n, pn, pn, pn,  n, pn, pn, pn, pn, pn, pn,  n, pn], // Fila 13
      [pn, pn,  n, pn, pn, pn, pn, pn, pn, pn, pn,  n, pn,  n, mn, pn, pn, mn,  n, pn], // Fila 14
      [pn, pn,  n, mn, pn, pn,  n,  n,  n,  n, pn,  n, pn,  n,  n,  n,  n,  n, mn, pn], // Fila 15
      [pn, pn,  n,  n, pn, pn,  n, pn, pn,  n, pn,  n, pn, mn,  n,  n,  n,  n,  n, pn], // Fila 16
      [pn, pn,  n, pn, pn, pn,  n, pn, pn,  n, pn,  n, pn,  n, pn, pn, pn, pn, pn, pn], // Fila 17
      [pn, pn,  n,  n,  n,  n,  n, pn, pn,  n,  n,  n, pn, pn, pn, pn, pn, pn, pn, pn], // Fila 18
      [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn]
     ]


  /*
    const matrizParedes = [
      [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn], // Fila 0
      [n,  n,  n,  n, n, n, n, n, n, n, n, n, n, n, n, n, n, n, n, pn], // Fila 1
      [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn], // Fila 2
      [n,  n,  n,  n, n, n, n, n, n, n, n, n, n, n, n, n, pn, n, n, pn], // Fila 3
      [n,  n,  n,  n, n, n, n, n, n, n, n, n, n, n, n, n, pn, pn, n, pn], // Fila 4
      [n,  n,  n,  n, n, n, n, n, n, n, n, n, pn, pn, pn, pn, pn, n, n, pn], // Fila 5
      [n,  n,  n,  n, n, n, n, n, n, n, n, n, pn, n, n, n, n, n, pn, pn], // Fila 6
      [n,  n,  n,  n, n, n, n, n, n, n, n, n, pn, n, pn, pn, pn, pn, pn, pn], // Fila 7
      [n,  pn,  pn,  pn, pn, pn, pn, pn, n, n, n, n, pn, n, pn, pn, pn, pn, pn, pn], // Fila 8
      [n, pn,  pn,  pn,  pn,  n,  n,  pn,  n,  n,  n, n, pn, n, pn, n, n, n, pn, pn], // Fila 9
      [n, pn,  pn, n, n,  n, n, pn,  n,  n,  n,  n,  pn,  n, n,  n,  pn,  n, n, pn], // Fila 10
      [pn, pn,  n,  n, mn,  n, pn, pn,  n,  n, pn, pn, pn,  n, pn,  n, pn, pn,  n, pn], // Fila 11
      [n, pn, n, n, pn, pn, n,  n,  n,  n,  n,  n, n,  n,  n,  n, n, n,  n, pn], // Fila 12
      [n, pn,  n,  pn,  pn,  pn,  pn,  pn, pn, pn, pn,  pn, pn, pn, pn, pn, pn, pn,  pn, pn], // Fila 13
      [n, pn,  n, n, pn, pn, pn, n, n, n, n,  pn, n,  n, n, n, n, n,  n, n], // Fila 14
      [n, n, pn, n, n, pn, n, n, pn, pn, n, pn, n, n, n, n, n, n, n, n], // Fila 15
      [n, n, n, pn, n, n, n, pn, n, pn, n, pn, n, n, n, n, n, n, n, n], // Fila 16
      [n, n, n, n, pn, pn, pn, n, n, pn, n, pn, n, n, n, n, n, n, n, n], // Fila 17
      [n, n, n, n, n, n, n, n, n, pn, n, pn, n, n, n, n, n, n, n, n], // Fila 18
      [n, n, n, n, n, n, n, n, n, pn, n, pn, n, n, n, n, n, n, n, n]
     ]


  */

  const paredes = []

  method matrizParedes() = matrizParedes
  
  method iniciarParedes(){
    paredes.forEach({pared => pared.iniciar()})
  }
  
  //TODO SOBRE MANZANAS
  const objetivoManzanas = 14
  
  var manzanasActuales = 0
  
  //AGRUEGUE LAS MANZANAS EN LA MATRIZ
  const manzanas = [
  new Manzana(x = 2, y = 2, imagen = "manzana.png"),
  new Manzana(x = 3, y = 16, imagen = "manzana.png"),
  new Manzana(x = 4, y = 12, imagen = "manzana.png"),
  new Manzana(x = 4, y = 15, imagen = "manzana.png"),
  new Manzana(x = 4, y = 16, imagen = "manzana.png"),
  new Manzana(x = 5, y = 13, imagen = "manzana.png"),
  new Manzana(x = 7, y = 1, imagen = "manzana.png"),
  new Manzana(x = 10, y = 18, imagen = "manzana.png"),
  new Manzana(x = 11, y = 5, imagen = "manzana.png"),
  new Manzana(x = 14, y = 14, imagen = "manzana.png"),
  new Manzana(x = 14, y = 17, imagen = "manzana.png"),
  new Manzana(x = 15, y = 3, imagen = "manzana.png"),
  new Manzana(x = 15, y = 18, imagen = "manzana.png"),
  new Manzana(x = 16, y = 13, imagen = "manzana.png")]
  

  method manzanasPartida() = manzanas

  method iniciarManzanas(){
    manzanas.forEach({manzana => manzana.iniciar()})
  }

  method sumarManzana(){
    manzanasActuales += 1
  }

  method iniciar() {
    game.height(20)
    game.width(20)
    game.cellSize(50)
    game.ground("fondo.png")
    personaje.iniciar()
    self.iniciarParedes()
    self.iniciarManzanas()
  }
  
  method personaje() = personaje
}

object personaje {
  var property position = game.at(1,1)
  var property imagen = "personaje.png"
  
  method image() = imagen
  
  method iniciar() {
    game.addVisualCharacter(self)
  }

  method interactuarPared(){
    //no pongo nada porque quiero que se quede en su posicion actual
  }

  method interactuarManzana(manzana){
    manzana.desaparecer()
    partida2.sumarManzana()
  }

  method moverse(direccion) {
    if (direccion == "derecha") {
      position = game.at(position.x() + 1, position.y())
    } else {
      if (direccion == "izquierda") {
        position = game.at(position.x() - 1, position.y())
      } else {
        if (direccion == "abajo") {
          position = game.at(position.x(), position.y() - 1)
        } else {
          if (direccion == "arriba") {
            position = game.at(position.x(), position.y() + 1)
          }
        }
      }
    }
  }
}

/*
  //PAREDES INTERNAS
  new Pared (x = 1, y = 4, imagen = "imagen.png"),
  new Pared (x = 1, y = 5, imagen = "imagen.png"),
  new Pared (x = 1, y = 6, imagen = "imagen.png"),
  new Pared (x = 1, y = 7, imagen = "imagen.png"),
  new Pared (x = 1, y = 8, imagen = "imagen.png"),
  new Pared (x = 1, y = 9, imagen = "imagen.png"),
  new Pared (x = 1, y = 10, imagen = "imagen.png"),
  new Pared (x = 1, y = 11, imagen = "imagen.png"),
  new Pared (x = 1, y = 12, imagen = "imagen.png"),
  new Pared (x = 1, y = 13, imagen = "imagen.png"),
  new Pared (x = 1, y = 14, imagen = "imagen.png"),
  new Pared (x = 1, y = 15, imagen = "imagen.png"),
  new Pared (x = 1, y = 16, imagen = "imagen.png"),
  new Pared (x = 1, y = 17, imagen = "imagen.png"),
  new Pared (x = 1, y = 18, imagen = "imagen.png"),
  new Pared (x = 1, y = 19, imagen = "imagen.png"),
  new Pared (x = 2, y = 4, imagen = "imagen.png"),
  new Pared (x = 2, y = 5, imagen = "imagen.png"),
  new Pared (x = 2, y = 11, imagen = "imagen.png"),
  new Pared (x = 2, y = 18, imagen = "imagen.png"),
  new Pared (x = 3, y = 1, imagen = "imagen.png"),
  new Pared (x = 3, y = 2, imagen = "imagen.png"),
  new Pared (x = 3, y = 4, imagen = "imagen.png"),
  new Pared (x = 3, y = 5, imagen = "imagen.png"),
  new Pared (x = 3, y = 7, imagen = "imagen.png"),
  new Pared (x = 3, y = 8, imagen = "imagen.png"),
  new Pared (x = 3, y = 9, imagen = "imagen.png"),
  new Pared (x = 3, y = 11, imagen = "imagen.png"),
  new Pared (x = 3, y = 13, imagen = "imagen.png"),
  new Pared (x = 3, y = 14, imagen = "imagen.png"),
  new Pared (x = 3, y = 18, imagen = "imagen.png"),
  new Pared (x = 4, y = 1, imagen = "imagen.png"),
  new Pared (x = 4, y = 2, imagen = "imagen.png"),
  new Pared (x = 4, y = 4, imagen = "imagen.png"),
  new Pared (x = 4, y = 5, imagen = "imagen.png"),
  new Pared (x = 4, y = 7, imagen = "imagen.png"),
  new Pared (x = 4, y = 8, imagen = "imagen.png"),
  new Pared (x = 4, y = 9, imagen = "imagen.png"),
  new Pared (x = 4, y = 13, imagen = "imagen.png"),
  new Pared (x = 4, y = 14, imagen = "imagen.png"),
  new Pared (x = 4, y = 18, imagen = "imagen.png"), 
  new Pared (x = 5, y = 1, imagen = "imagen.png"),
  new Pared (x = 5, y = 4, imagen = "imagen.png"),
  new Pared (x = 5, y = 5, imagen = "imagen.png"),
  new Pared (x = 5, y = 7, imagen = "imagen.png"),
  new Pared (x = 5, y = 8, imagen = "imagen.png"),
  new Pared (x = 5, y = 9, imagen = "imagen.png"),
  new Pared (x = 5, y = 10, imagen = "imagen.png"),
  new Pared (x = 5, y = 11, imagen = "imagen.png"),
  new Pared (x = 5, y = 12, imagen = "imagen.png"),
  new Pared (x = 5, y = 15, imagen = "imagen.png"),
  new Pared (x = 5, y = 16, imagen = "imagen.png"),
  new Pared (x = 5, y = 18, imagen = "imagen.png"),
  new Pared (x = 6, y = 5, imagen = "imagen.png"),
  new Pared (x = 6, y = 7, imagen = "imagen.png"),
  new Pared (x = 6, y = 8, imagen = "imagen.png"),
  new Pared (x = 6, y = 9, imagen = "imagen.png"),
  new Pared (x = 6, y = 10, imagen = "imagen.png"),
  new Pared (x = 6, y = 11, imagen = "imagen.png"),
  new Pared (x = 6, y = 12, imagen = "imagen.png"),
  new Pared (x = 6, y = 15, imagen = "imagen.png"),
  new Pared (x = 6, y = 16, imagen = "imagen.png"),
  new Pared (x = 6, y = 18, imagen = "imagen.png"),
  new Pared (x = 7, y = 5, imagen = "imagen.png"),
  new Pared (x = 7, y = 9, imagen = "imagen.png"),
  new Pared (x = 7, y = 18, imagen = "imagen.png"),
  new Pared (x = 8, y = 1, imagen = "imagen.png"),
  new Pared (x = 8, y = 2, imagen = "imagen.png"),
  new Pared (x = 8, y = 3, imagen = "imagen.png"),
  new Pared (x = 8, y = 5, imagen = "imagen.png"),
  new Pared (x = 8, y = 6, imagen = "imagen.png"),
  new Pared (x = 8, y = 7, imagen = "imagen.png"),
  new Pared (x = 8, y = 11, imagen = "imagen.png"),
  new Pared (x = 8, y = 12, imagen = "imagen.png"),
  new Pared (x = 8, y = 13, imagen = "imagen.png"),
  new Pared (x = 8, y = 14, imagen = "imagen.png"),
  new Pared (x = 8, y = 15, imagen = "imagen.png"),
  new Pared (x = 8, y = 16, imagen = "imagen.png"),
  new Pared (x = 8, y = 17, imagen = "imagen.png"),
  new Pared (x = 8, y = 18, imagen = "imagen.png"),
  new Pared (x = 9, y = 1, imagen = "imagen.png"),
  new Pared (x = 9, y = 11, imagen = "imagen.png"),
  new Pared (x = 9, y = 12, imagen = "imagen.png"),
  new Pared (x = 9, y = 13, imagen = "imagen.png"),
  new Pared (x = 9, y = 14, imagen = "imagen.png"),
  new Pared (x = 9, y = 15, imagen = "imagen.png"),
  new Pared (x = 9, y = 16, imagen = "imagen.png"),
  new Pared (x = 9, y = 17, imagen = "imagen.png"),
  new Pared (x = 9, y = 18, imagen = "imagen.png"),
  new Pared (x = 10, y = 1, imagen = "imagen.png"),
  new Pared (x = 10, y = 3, imagen = "imagen.png"),
  new Pared (x = 10, y = 4, imagen = "imagen.png"),
  new Pared (x = 10, y = 6, imagen = "imagen.png"),
  new Pared (x = 10, y = 7, imagen = "imagen.png"),
  new Pared (x = 10, y = 14, imagen = "imagen.png"),
  new Pared (x = 11, y = 1, imagen = "imagen.png"),
  new Pared (x = 11, y = 6, imagen = "imagen.png"),
  new Pared (x = 11, y = 7, imagen = "imagen.png"),
  new Pared (x = 11, y = 10, imagen = "imagen.png"),
  new Pared (x = 11, y = 11, imagen = "imagen.png"),
  new Pared (x = 11, y = 12, imagen = "imagen.png"),
  new Pared (x = 11, y = 14, imagen = "imagen.png"),
  new Pared (x = 11, y = 16, imagen = "imagen.png"),
  new Pared (x = 11, y = 17, imagen = "imagen.png"),
  new Pared (x = 12, y = 1, imagen = "imagen.png"),
  new Pared (x = 12, y = 2, imagen = "imagen.png"),
  new Pared (x = 12, y = 3, imagen = "imagen.png"),
  new Pared (x = 12, y = 4, imagen = "imagen.png"),
  new Pared (x = 12, y = 5, imagen = "imagen.png"),
  new Pared (x = 12, y = 6, imagen = "imagen.png"),
  new Pared (x = 12, y = 12, imagen = "imagen.png"),
  new Pared (x = 12, y = 16, imagen = "imagen.png"),
  new Pared (x = 12, y = 17, imagen = "imagen.png"),
  new Pared (x = 13, y = 1, imagen = "imagen.png"),
  new Pared (x = 13, y = 8, imagen = "imagen.png"),
  new Pared (x = 13, y = 9, imagen = "imagen.png"),
  new Pared (x = 13, y = 10, imagen = "imagen.png"),
  new Pared (x = 13, y = 12, imagen = "imagen.png"),
  new Pared (x = 13, y = 13, imagen = "imagen.png"),
  new Pared (x = 13, y = 14, imagen = "imagen.png"),
  new Pared (x = 13, y = 15, imagen = "imagen.png"),
  new Pared (x = 13, y = 16, imagen = "imagen.png"),
  new Pared (x = 13, y = 17, imagen = "imagen.png"),
  new Pared (x = 14, y = 1, imagen = "imagen.png"),
  new Pared (x = 14, y = 3, imagen = "imagen.png"),
  new Pared (x = 14, y = 4, imagen = "imagen.png"),
  new Pared (x = 14, y = 5, imagen = "imagen.png"),
  new Pared (x = 14, y = 6, imagen = "imagen.png"),
  new Pared (x = 14, y = 7, imagen = "imagen.png"),
  new Pared (x = 14, y = 8, imagen = "imagen.png"),
  new Pared (x = 14, y = 9, imagen = "imagen.png"),
  new Pared (x = 14, y = 10, imagen = "imagen.png"),
  new Pared (x = 14, y = 12, imagen = "imagen.png"),
  new Pared (x = 14, y = 15, imagen = "imagen.png"),
  new Pared (x = 14, y = 16, imagen = "imagen.png"),
  new Pared (x = 15, y = 1, imagen = "imagen.png"),
  new Pared (x = 15, y = 4, imagen = "imagen.png"),
  new Pared (x = 15, y = 5, imagen = "imagen.png"),
  new Pared (x = 15, y = 10, imagen = "imagen.png"),
  new Pared (x = 15, y = 12, imagen = "imagen.png"),
  new Pared (x = 16, y = 1, imagen = "imagen.png"),
  new Pared (x = 16, y = 4, imagen = "imagen.png"),
  new Pared (x = 16, y = 5, imagen = "imagen.png"),
  new Pared (x = 16, y = 7, imagen = "imagen.png"),
  new Pared (x = 16, y = 8, imagen = "imagen.png"),
  new Pared (x = 16, y = 10, imagen = "imagen.png"),
  new Pared (x = 16, y = 12, imagen = "imagen.png"),
  new Pared (x = 17, y = 1, imagen = "imagen.png"),
  new Pared (x = 17, y = 3, imagen = "imagen.png"),
  new Pared (x = 17, y = 4, imagen = "imagen.png"),
  new Pared (x = 17, y = 5, imagen = "imagen.png"),
  new Pared (x = 17, y = 7, imagen = "imagen.png"),
  new Pared (x = 17, y = 8, imagen = "imagen.png"),
  new Pared (x = 17, y = 10, imagen = "imagen.png"),
  new Pared (x = 17, y = 12, imagen = "imagen.png"),
  new Pared (x = 17, y = 14, imagen = "imagen.png"),
  new Pared (x = 17, y = 15, imagen = "imagen.png"),
  new Pared (x = 17, y = 16, imagen = "imagen.png"),
  new Pared (x = 17, y = 17, imagen = "imagen.png"),
  new Pared (x = 17, y = 18, imagen = "imagen.png"),
  new Pared (x = 18, y = 1, imagen = "imagen.png"),
  new Pared (x = 18, y = 7, imagen = "imagen.png"),
  new Pared (x = 18, y = 8, imagen = "imagen.png"),
  new Pared (x = 18, y = 12, imagen = "imagen.png"),
  new Pared (x = 18, y = 13, imagen = "imagen.png"),
  new Pared (x = 18, y = 14, imagen = "imagen.png"),
  new Pared (x = 18, y = 15, imagen = "imagen.png"),
  new Pared (x = 18, y = 16, imagen = "imagen.png"),
  new Pared (x = 18, y = 17, imagen = "imagen.png"),
  new Pared (x = 18, y = 18, imagen = "imagen.png")

  //BORDES
  new Pared (x = 1, y = 0, imagen = "imagen.png"),
  new Pared (x = 2, y = 0, imagen = "imagen.png"),
  new Pared (x = 3, y = 0, imagen = "imagen.png"),
  new Pared (x = 4, y = 0, imagen = "imagen.png"),
  new Pared (x = 5, y = 0, imagen = "imagen.png"),
  new Pared (x = 6, y = 0, imagen = "imagen.png"),
  new Pared (x = 7, y = 0, imagen = "imagen.png"),
  new Pared (x = 8, y = 0, imagen = "imagen.png"),
  new Pared (x = 9, y = 0, imagen = "imagen.png"),
  new Pared (x = 10, y = 0, imagen = "imagen.png"),
  new Pared (x = 11, y = 0, imagen = "imagen.png"),
  new Pared (x = 12, y = 0, imagen = "imagen.png"),
  new Pared (x = 13, y = 0, imagen = "imagen.png"),
  new Pared (x = 14, y = 0, imagen = "imagen.png"),
  new Pared (x = 15, y = 0, imagen = "imagen.png"),
  new Pared (x = 16, y = 0, imagen = "imagen.png"),
  new Pared (x = 17, y = 0, imagen = "imagen.png"),
  new Pared (x = 18, y = 0, imagen = "imagen.png"),
  new Pared (x = 19, y = 0, imagen = "imagen.png"),
  new Pared (x = 20, y = 0, imagen = "imagen.png"),
  new Pared (x = 0, y = 19, imagen = "imagen.png"),
  new Pared (x = 1, y = 19, imagen = "imagen.png"),
  new Pared (x = 2, y = 19, imagen = "imagen.png"),
  new Pared (x = 3, y = 19, imagen = "imagen.png"),
  new Pared (x = 4, y = 19, imagen = "imagen.png"),
  new Pared (x = 5, y = 19, imagen = "imagen.png"),
  new Pared (x = 6, y = 19, imagen = "imagen.png"),
  new Pared (x = 7, y = 19, imagen = "imagen.png"),
  new Pared (x = 8, y = 19, imagen = "imagen.png"),
  new Pared (x = 9, y = 19, imagen = "imagen.png"),
  new Pared (x = 10, y = 19, imagen = "imagen.png"),
  new Pared (x = 11, y = 19, imagen = "imagen.png"),
  new Pared (x = 12, y = 19, imagen = "imagen.png"),
  new Pared (x = 13, y = 19, imagen = "imagen.png"),
  new Pared (x = 14, y = 19, imagen = "imagen.png"),
  new Pared (x = 15, y = 19, imagen = "imagen.png"),
  new Pared (x = 16, y = 19, imagen = "imagen.png"),
  new Pared (x = 17, y = 19, imagen = "imagen.png"),
  new Pared (x = 18, y = 19, imagen = "imagen.png"),
  new Pared (x = 19, y = 19, imagen = "imagen.png"),
  new Pared (x = 0, y = 0, imagen = "imagen.png"),
  new Pared (x = 0, y = 1, imagen = "imagen.png"),
  new Pared (x = 0, y = 2, imagen = "imagen.png"),
  new Pared (x = 0, y = 3, imagen = "imagen.png"),
  new Pared (x = 0, y = 4, imagen = "imagen.png"),
  new Pared (x = 0, y = 5, imagen = "imagen.png"),
  new Pared (x = 0, y = 6, imagen = "imagen.png"),
  new Pared (x = 0, y = 7, imagen = "imagen.png"),
  new Pared (x = 0, y = 8, imagen = "imagen.png"),
  new Pared (x = 0, y = 9, imagen = "imagen.png"),
  new Pared (x = 0, y = 10, imagen = "imagen.png"),
  new Pared (x = 0, y = 11, imagen = "imagen.png"),
  new Pared (x = 0, y = 12, imagen = "imagen.png"),
  new Pared (x = 0, y = 13, imagen = "imagen.png"),
  new Pared (x = 0, y = 14, imagen = "imagen.png"),
  new Pared (x = 0, y = 15, imagen = "imagen.png"),
  new Pared (x = 0, y = 16, imagen = "imagen.png"),
  new Pared (x = 0, y = 17, imagen = "imagen.png"),
  new Pared (x = 0, y = 18, imagen = "imagen.png"),
  new Pared (x = 0, y = 19, imagen = "imagen.png"),
  new Pared (x = 0, y = 20, imagen = "imagen.png"),
  new Pared (x = 19, y = 0, imagen = "imagen.png"),
  new Pared (x = 19, y = 1, imagen = "imagen.png"),
  new Pared (x = 19, y = 2, imagen = "imagen.png"),
  new Pared (x = 19, y = 3, imagen = "imagen.png"),
  new Pared (x = 19, y = 4, imagen = "imagen.png"),
  new Pared (x = 19, y = 5, imagen = "imagen.png"),
  new Pared (x = 19, y = 6, imagen = "imagen.png"),
  new Pared (x = 19, y = 7, imagen = "imagen.png"),
  new Pared (x = 19, y = 8, imagen = "imagen.png"),
  new Pared (x = 19, y = 9, imagen = "imagen.png"),
  new Pared (x = 19, y = 10, imagen = "imagen.png"),
  new Pared (x = 19, y = 11, imagen = "imagen.png"),
  new Pared (x = 19, y = 12, imagen = "imagen.png"),
  new Pared (x = 19, y = 13, imagen = "imagen.png"),
  new Pared (x = 19, y = 14, imagen = "imagen.png"),
  new Pared (x = 19, y = 15, imagen = "imagen.png"),
  new Pared (x = 19, y = 16, imagen = "imagen.png"),
  new Pared (x = 19, y = 17, imagen = "imagen.png"),
  new Pared (x = 19, y = 18, imagen = "imagen.png"),
  new Pared (x = 19, y = 19, imagen = "imagen.png"),
  new Pared (x = 19, y = 20, imagen = "imagen.png"),
*/
  
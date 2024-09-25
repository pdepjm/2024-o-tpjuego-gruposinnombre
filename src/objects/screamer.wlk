import wollok.game.*
import juego3.*
import general.*

object partida4
{
    method iniciar()
    {
    game.title("laberinto")
    game.height(50)
    game.width(50)
    game.cellSize(90)
    game.ground("negro.png")
    managerParedes.iniciar()
    personaje.iniciar()
    manzanaScreamer.iniciar()
    }
}

class Paredd{ //doble d para que no se pise con la ya hecha
  const x
  const y
  const property position = game.at(x, y)
  method image()= "pared.png"
  
  method iniciar() {
    game.addVisual(self)
    }

 method interactuar() {
    personaje.resetPosition()
  }
} 


object manzanaScreamer {
  var property position = game.at(48, 10)
  method image()= "manzana.png"
  method iniciar() {
    game.addVisual(self)
  }

   method interactuar() {
    personaje.ponerScreamer()
  }
} 


object personaje {
  var property position = game.at(48, 0)
  method image()= "mineSteve.gif" 

  method iniciar() 
  {
    game.addVisualCharacter(self)
    game.whenCollideDo(self, {objeto => objeto.interactuar()})
   
  }

 method resetPosition() 
 {
  position = game.at(48, 0)
 }

 method ponerScreamer()
 {
  prueba.iniciar()
  self.resetPosition()
 }

}

object prueba {
  var property position = game.at(15, 15)
  method image() = "messi.png"

  method iniciar() 
  {
    game.addVisual(self)
  }

} 

/*prueba es la foto de messi, el personaje al impactar con la manzana lanza el prueba.iniciar, ahora le puse
que spawnee en unas coordenadas, pero el objetivo es que rellene toda la pantalla*/

object managerParedes {
  const paredes = 
[ new Paredd(x = 0 , y = 0), 
  new Paredd(x = 0 , y = 0), 
  new Paredd(x = 0 , y = 0),
  new Paredd(x = 0 , y = 0),
  new Paredd(x = 0 , y = 0),
  new Paredd(x = 0 , y = 0),
  new Paredd(x = 0 , y = 0),
  new Paredd(x = 0 , y = 0),
  new Paredd(x = 0 , y = 0),
  new Paredd(x = 0 , y = 0),
  new Paredd(x = 0 , y = 0),
  new Paredd(x = 0 , y = 0),
  new Paredd(x = 0 , y = 0),
  new Paredd(x = 0 , y = 0),
  new Paredd(x = 0 , y = 0) ]

  method iniciar() {
    paredes.forEach({pared=> pared.iniciar()})

  }
  
}

import wollok.game.*
import juego3.*
import general.*

object partida4
{
    const paredes = 
      [new Pared(x = 1 , y = 0, imagen = "imagen"), 
      new Pared(x = 1 , y = 0, imagen = "imagen"),
      new Pared(x = 1 , y = 0, imagen = "imagen"),
      new Pared(x = 1 , y = 0, imagen = "imagen")]

    method paredesPartida() = paredes

    method iniciar()
    {
    managerPared.iniciar(paredes)
    game.height(50)
    game.width(50)
    game.cellSize(90)
    game.ground("negro.png")
    personaje.iniciar()
    manzanaScreamer.iniciar()
    }
}

const manzanaScreamer = new Manzana(x = 15, y = 15, imagen = "imagen")


object personaje {
  var property position = game.at(48, 0)
  method image()= "mineSteve.gif" 

  method interactuarManzana()
  {
    self.ponerScreamer()
  }

  method iniciar() 
  {
    game.addVisualCharacter(self)
    game.whenCollideDo(self, {objeto => objeto.interactuar()})
   
  }

  method interactuarPared()
  {
    self.resetPosition()
  }

 method resetPosition() 
 {
  position = game.at(20, 20)
 }

 method ponerScreamer()
 {
  screamer.iniciar()
  self.resetPosition()
 }

}

object screamer {
  var property position = game.at(15, 15)
  method image() = "messi.png"

  method iniciar() 
  {
    game.addVisual(self)
  }

} 

/*prueba es la foto de messi, el personaje al impactar con la manzana lanza el prueba.iniciar, ahora le puse
que spawnee en unas coordenadas, pero el objetivo es que rellene toda la pantalla*/

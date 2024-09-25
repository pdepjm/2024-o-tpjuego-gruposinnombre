import wollok.game.*
import juego3.*
import general.*

object partida4
{
  //Mapa completo de 10x8 delimitado por paredes sin paredes en el medio
  const paredes = 
  [new Pared(x = 0 , y = 0, imagen = "imagen"), 
  new Pared(x = 1 , y = 0, imagen = "imagen"),
  new Pared(x = 2 , y = 0, imagen = "imagen"),
  new Pared(x = 3 , y = 0, imagen = "imagen"),
  new Pared(x = 4 , y = 0, imagen = "imagen"),
  new Pared(x = 5 , y = 0, imagen = "imagen"),
  new Pared(x = 6 , y = 0, imagen = "imagen"),
  new Pared(x = 7 , y = 0, imagen = "imagen"),
  new Pared(x = 8 , y = 0, imagen = "imagen"),
  new Pared(x = 9 , y = 0, imagen = "imagen"),
  new Pared(x = 0 , y = 7, imagen = "imagen"),
  new Pared(x = 1 , y = 7, imagen = "imagen"),
  new Pared(x = 2 , y = 7, imagen = "imagen"),
  new Pared(x = 3 , y = 7, imagen = "imagen"),
  new Pared(x = 4 , y = 7, imagen = "imagen"),
  new Pared(x = 5 , y = 7, imagen = "imagen"),
  new Pared(x = 6 , y = 7, imagen = "imagen"),
  new Pared(x = 7 , y = 7, imagen = "imagen"),
  new Pared(x = 8 , y = 7, imagen = "imagen"),
  new Pared(x = 9 , y = 7, imagen = "imagen"),
  new Pared(x = 0 , y = 1, imagen = "imagen"),
  new Pared(x = 0 , y = 2, imagen = "imagen"),
  new Pared(x = 0 , y = 3, imagen = "imagen"),
  new Pared(x = 0 , y = 4, imagen = "imagen"),
  new Pared(x = 0 , y = 5, imagen = "imagen"),
  new Pared(x = 0 , y = 6, imagen = "imagen"),
  new Pared(x = 9 , y = 1, imagen = "imagen"),
  new Pared(x = 9 , y = 2, imagen = "imagen"),
  new Pared(x = 9 , y = 3, imagen = "imagen"),
  new Pared(x = 9 , y = 4, imagen = "imagen"),
  new Pared(x = 9 , y = 5, imagen = "imagen"),
  new Pared(x = 9 , y = 6, imagen = "imagen")]

  method paredesPartida() = paredes

  method personaje() = personaje

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

  method moverse(direccion)
  {
    if(direccion == "derecha")
    {

      position = game.at(position.x() + 1, position.y())

    }
        
    else if(direccion == "izquierda")
    {
            
    position = game.at(position.x() -1, position.y())

    }
        
    else if(direccion == "arriba")
    {
            
      position = game.at(position.x(), position.y() + 1)

    }

    else if(direccion == "abajo")
    {
            
      position = game.at(position.x(), position.y() - 1)

    }

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



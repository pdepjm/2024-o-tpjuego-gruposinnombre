class Manzana {
    var property position
    var imagen
    method image() = imagen

    method desaparecer()
    {
        game.removeVisual(self)
    }
}

object partida
{
    const objetivoManzanas = 5
    var manzanasActuales = 0

    method sumarManzana()
    {
        manzanasActuales ++
        if(manzanasActuales == objetivoManzanas)
        {
            //En este caso se debería pasar de nivel
            return 1
        }
        else
        {
            return 0
        }
    }
}


object mapaJuego1
{
    const paredes = []
    method paredes() = paredes
}

object cabeza {
  const cuerpos = []
  var property position = game.center()
  
  method moverse(direccion)
  {
    if(direccion == derecha)
    {
        position = game.at(self.x() + 1, self.y())
    }
    if(direccion == izquierda)
    {
        position = game.at(self.x() -1, self.y())
    }
    if(direccion == arriba)
    {
        position = game.at(self.x(), self.y() + 1)
    }
    if(direccion == abajo)
    {
        position = game.at(self.x(), self.y() - 1)
    }
  }
  method crecer()
  {
    cuerpos.add(new Cuerpo())
  }
  
}

class Cuerpo {
  var property position
  method seguirSiguiente() {}
  
}
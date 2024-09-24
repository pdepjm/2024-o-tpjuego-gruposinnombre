import wollok.game.*

class Pared {
    
    var property  position
   
    var imagen
   
    method image() = imagen
}

class Manzana {

    var property position

    var imagen

    method image() = imagen

    method desaparecer()
    {
        
        game.removeVisual(self)

    }

}

object cabeza {
    
    const cuerpos = []
    
    var property position = game.center()
  
    var posicionProximoCuerpo = position

    method moverse(direccion)
    {
        
        posicionProximoCuerpo = cuerpos.last().position()

        var viejaPosicion = position

        var nuevaViejaPosicion
    
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
        
        cuerpos.foreach
        ({
            cuerpo =>

            nuevaViejaPosicion = cuerpo.position()

            cuerpo.position(viejaPosicion)

            viejaPosicion = nuevaViejaPosicion

        })

    }

    method crecer()
    {

        cuerpos.add(new Cuerpo(position = posicionProximoCuerpo, imagen =))

    }
  
}

class Cuerpo 
{
    
    var property position 

    var imagen

    method image() = imagen

}


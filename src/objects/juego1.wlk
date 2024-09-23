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
  
    var property posicionProximoCuerpo = position

    method moverse(direccion)
    {
        
        posicionProximoCuerpo = cuerpos.last.position()

        var viejaPosicion = position

        var nuevaViejaPosicion
    
        if(direccion == derecha)
        {

            position = game.at(self.x() + 1, self.y())

        }
        
        else if(direccion == izquierda)
        {
            
            position = game.at(self.x() -1, self.y())

        }
        
        else if(direccion == arriba)
        {
            
            position = game.at(self.x(), self.y() + 1)

        }

        else if(direccion == abajo)
        {
            
            position = game.at(self.x(), self.y() - 1)

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

        cuerpos.add(new Cuerpo(posicionProximoCuerpo))

    }
  
}

class Cuerpo 
{
    
    var property position

}
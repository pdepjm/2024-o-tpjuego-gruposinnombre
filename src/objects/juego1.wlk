import screamer.*
import wollok.game.*
import juego2.*
import general.*

object partida1
{
   
    const objetivoManzanas = 5
    
    const paredes = 
  [new Pared(x = 1 , y = 0, imagen = "imagen"), 
  new Pared(x = 1 , y = 0, imagen = "imagen"),
  new Pared(x = 1 , y = 0, imagen = "imagen"),
  new Pared(x = 1 , y = 0, imagen = "imagen")]

    method paredesPartida() = paredes

    var manzanasActuales = 0

    method iniciar()
    {
        managerPared.iniciar(paredes)
        
        //CUal es mi background
        //Cambiar la imagen de la manzana
    }

    method terminar()
    {
        //Elimino todos mis objetos
    }

    method sumarManzana()
    {
        
        manzanasActuales ++
       
        if(manzanasActuales == objetivoManzanas)
        {
           
            //En este caso se debería pasar de nivel
            self.terminar()
            partida.nuevaPartida(partida2)
            partida2.iniciar()


        }
        
        else
        {

            return 0

        }
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

    method interactuarManzana(manzana)
    {

        manzana.desaparecer()

        partida1.sumarManzana()

        self.crecer()

    }

    method interactuarPared()
    {
    }

    method crecer()
    {

        cuerpos.add(new Cuerpo(position = posicionProximoCuerpo, imagen = "imagen"))

    }
  
}

class Cuerpo 
{
    
    var property position 

    var imagen

    method image() = imagen

}
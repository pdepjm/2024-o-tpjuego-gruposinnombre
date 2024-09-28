import wollok.game.*
import juego2.*
import general.*

object partida1
{
   
    const objetivoManzanas = 5

    const manzanasEnMapa = []

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

    var manzanasActuales = 0

    method iniciar()
    {
        
        game.height(8)
	
	    game.width(10)
	
	    game.cellSize(40)

        partida.nuevaPartida(self)

        game.ground("imagen")

        self.iniciarParedes()

        game.addVisual(cabeza)

        cabeza.position(game.center())
        //CUal es mi background
        //Cambiar la imagen de la manzana
    }

    method finalizarParedes()
    {
        paredes.foreach({ pared => pared.iniciar() })
    }

    method iniciarParedes()
    {
        paredes.foreach({ pared => pared.iniciar() })
    }

    method terminar()
    {
        
        game.removeVisual(cabeza)

        self.finalizarParedes()

        cabeza.destruirCuerpos()

        manzanasEnMapa.foreach
        ({

            manzana => 
            
            manzana.desaparecer()

            manzanasEnMapa.remove(manzana)

        })

    }

    method reiniciar()
    {
        self.terminar()

        manzanasActuales = 0

        self.iniciar()

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

    }

    method personaje() = cabeza
}


object cabeza {
    
    const cuerpos = []

    method image() = "imagen"
    
    var property position = game.center()
  
    var posicionProximoCuerpo = position

    method destruirCuerpos()
    {

        cuerpos.forEach
        ({
            
            cuerpo =>

            game.removeVisual(cuerpo)

            cuerpos.remove(cuerpo)

        })

    }

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
        var nuevoCuerpo = new Cuerpo(position = posicionProximoCuerpo, imagen = "imagen")

        nuevoCuerpo.iniciar()

        cuerpos.add(nuevoCuerpo)

    }

    method interactuarCuerpo()
    {
        partida1.reiniciar()
    }
  
}

class Cuerpo 
{
    
    var property position 

    var imagen

    method image() = imagen

    method iniciar()
    {
        game.whenCollideDo(self, {personaje => personaje.interactuarCuerpo()})
        
        game.addVisual(self)
    }

}
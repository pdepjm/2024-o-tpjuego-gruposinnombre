import wollok.game.*
import juego1.*
import juego2.*
import juego3.*
import screamer.*

class Pared {
   
    const x
   
    const y

    var imagen
       
    var property  position = game.at(x,y)

    method image() = imagen

    method iniciarPared()
    {
        
        game.whenCollideDo(self, {personaje => personaje.interactuarPared(self)})

        game.addVisual(self)
    }

    method finalizarPared()
    {
        game.removeVisual(self)
    }
    

}

object managerPared
{
    method iniciar(paredes)
    {
        paredes.foreach
        ({
            pared =>

            pared.iniciarPared()

        })
    }

    method finalizar(paredes)
    {
        paredes.foreach
        ({
            pared =>

            pared.finalizarPared()

        })
    }
}

class Manzana {

    const x

    const y

    var property position = game.at(x,y)

    var imagen

    method image() = imagen

    method desaparecer()
    {
        
        game.removeVisual(self)

    }
    
    method iniciar()
    {
        game.whenCollideDo(self, {personaje => personaje.interactuarManzana(self)})
        
        game.addVisual(self)
    }

}

object partida
{
    var partidaActual = partida1

    var personajeActual = partidaActual.personaje()

    method nuevaPartida(partida)
    {
        partidaActual = partida
    }

    method personaje() = personajeActual

    method paredes() = partidaActual.paredesPartida()
}





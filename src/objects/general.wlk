import wollok.game.*

class Pared {
   
    const x
   
    const y

    var imagen
       
    var property  position = game.at(x,y)

    method image() = imagen

    method iniciarPared()
    {
        game.whenCollideDo(self, {personaje => personaje.interactuarPared(self)})
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

            game.addVisual(pared)

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
    }

}

object partida
{
    var partidaActual = partida1

    var personajeActual = cabeza

    method nuevaPartida(partida)
    {
        partidaActual = partida
    }

    method personaje() = personajeActual

    method paredes() = partidaActual.paredesPartida()
}





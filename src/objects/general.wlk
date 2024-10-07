import wollok.game.*
import juego1.*
import juego2.*
import juego3.*
import screamer.*

class Pared {
  var property position = game.center()
  
  method image()

  method iniciar() {
    game.whenCollideDo(self, { personaje => personaje.interactuarPared() })
    game.addVisual(self)
  }
  
  method finalizar() {
    game.removeVisual(self)
  }
}

class ParedQueNoHaceNada inherits Pared
{

  method interactuarPersona()
  {
  }
}

class ParedQueReinicia inherits Pared
{

  method interactuarPersona()
  {
    partida.partidaActual().reiniciar()
  }
}

class Manzana {
  const x
  const y
  var property position = game.at(x, y)
  const imagen
  
  method image() = imagen
  
  method iniciar() {
    game.whenCollideDo(self, { personaje => personaje.interactuarManzana(self) })
    game.addVisual(self)
  }
  
  method desaparecer() {
    game.removeVisual(self)
  }
  
}

object partida {

  var property partidaActual = partida1

  var personajeActual = partidaActual.personaje()
  
  method nuevaPartida(partida) {

    partidaActual = partida

  }
  
  method personaje() = personajeActual
  
  method paredes() = partidaActual.paredesPartida()
}

object izquierda
{
  const personaje = partida.personaje()

  const position = personaje.position()

  const nuevaPosicion = game.at(position.x() - 1, position.y())

  method moverse()
  {
    personaje.position(nuevaPosicion)

    personaje.moverCuerpos(position)
  }
}

object derecha
{
  const personaje = partida.personaje()

  const position = personaje.position()

  const nuevaPosicion = game.at(position.x() + 1, position.y())

  method moverse()
  {
    personaje.position(nuevaPosicion)

    personaje.moverCuerpos(position)
  }
}

object arriba
{
  const personaje = partida.personaje()

  const position = personaje.position()

  const nuevaPosicion = game.at(position.x(), position.y() + 1)

  method moverse()
  {
    personaje.position(nuevaPosicion)

    personaje.moverCuerpos(position)
  }
}

object abajo
{
  const personaje = partida.personaje()

  const position = personaje.position()

  const nuevaPosicion = game.at(position.x(), position.y() - 1)

  method moverse()
  {
    personaje.position(nuevaPosicion)

    personaje.moverCuerpos(position)
  }
}

object decodificadorParedes
{
  method decodificarParedes()
  {
    partida.paredes().foreach
    ({
      fila =>
        
        fila.foreach
        ({
          pared => pared.decodificar()
        })
    })
  }

}

object pn
{
  method decodificar() = new ParedQueNoHaceNada()
}

object pr
{
  method decodificar() = new ParedQueResetea()
}

object n
{
  method decodificar()
  {

  }
}

import wollok.game.*
import juego1.*
import juego2.*
import juego3.*
import screamer.*

/*-----------------------------------------------OBJETO PARTIDA, EL MÁS IMPORTANTE DE TODOS-----------------------------------------*/

object partida {

  var property partidaActual = partida1

  var property imagenPared = partidaActual.imagenPared()

  var property imagenManzana = partidaActual.imagenManzana()

  var personajeActual = partidaActual.personaje()
  
  //Se usa para definir qué partida está ocurriendo en un instante determinado
  method nuevaPartida(partida) {

    partidaActual = partida

  }
  
  method personaje() = personajeActual

  method matrizParedes() = partidaActual.matrizParedes()
  
  method paredes() = partidaActual.paredesPartida()
}
/*---------------------------------------------Clase general de las manzanas y paredes-------------------------------------*/
class Cosas {

  var x

  var y 

  var property position = game.at(x, y)
  
  method finalizar() {

    game.removeVisual(self)

  }
}


/*---------------------------------------------Objetos relacionados con las manzanas-------------------------------------*/
class Manzana inherits Cosas {

  const imagen
  
  method image() = imagen
  
  method iniciar() {

    game.whenCollideDo(self, { personaje => personaje.interactuarManzana(self) })

    game.addVisual(self)
  }
  
}

/*------------------------Objetos relacionados con las direcciones y los movimientos de los personajes------------------------------------*/
//PRUEBA DE HERENCIA CON LOS MOVIMIENTOS

//SUPERCLASE
class Movimiento
{
  const personaje = partida.personaje()

  const position = personaje.position()

  method nuevaPosicion() = game.at(0,0)

  method moverse()
  {
    personaje.position(self.nuevaPosicion())

    personaje.moverCuerpos(position)
  }
}

//OBJETOS
object izquierda inherits Movimiento {
  override method nuevaPosicion()  = game.at(personaje.position().x() - 1, personaje.position().y())
}

object derecha inherits Movimiento {
  override method nuevaPosicion() = game.at(personaje.position().x() + 1, personaje.position().y())
}

object arriba inherits Movimiento {
  override method nuevaPosicion() = game.at(personaje.position().x(), personaje.position().y() + 1)
}

object abajo inherits Movimiento {
  override method nuevaPosicion() = game.at(personaje.position().x(), personaje.position().y() - 1)
}

/*
object izquierda
{
  const personaje = partida.personaje()

  const position = personaje.position()

  method nuevaPosicion() = game.at(personaje.position().x() - 1, personaje.position().y())

  method moverse()
  {
    personaje.position(self.nuevaPosicion())

    personaje.moverCuerpos(position)
  }
}

object derecha
{
  const personaje = partida.personaje()

  const position = personaje.position()

  method nuevaPosicion() = game.at(personaje.position().x() + 1, personaje.position().y())

  method moverse()
  {
    personaje.position(self.nuevaPosicion())

    personaje.moverCuerpos(position)
  }
}

object arriba
{
  const personaje = partida.personaje()

  const position = personaje.position()

  method nuevaPosicion() = game.at(personaje.position().x(), personaje.position().y() + 1)

  method moverse()
  {
  
    personaje.position(self.nuevaPosicion())

    personaje.moverCuerpos(position)
  }
}

object abajo
{
  const personaje = partida.personaje()

  const position = personaje.position()

  method nuevaPosicion() = game.at(personaje.position().x(), personaje.position().y() - 1)

  method moverse()
  {
    personaje.position(self.nuevaPosicion())

    personaje.moverCuerpos(position)
  }
}
*/

/*----------------------------------------------TODO SOBRE PAREDES-----------------------------------------------------------------------*/

/*--------------------------------------CLASES---------------------------------------------*/

class Pared inherits Cosas {

  method image() = partida.imagenPared()

  method iniciar() {

    game.whenCollideDo(self, { personaje => personaje.interactuarPared() })

    game.addVisual(self)

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


/*---------------------------OBJETOS CON LOS QUE HAGO LA MATRIZ DEL MAPA------------------------------*/

object decodificadorParedes
{
  var i = 0
  var j = 0

  method decodificarParedes()
  {
    partida.matrizParedes().foreach({fila => 
        fila.foreach({ pared => 
          
          var nuevaPared = pared.decodificar(i, j)

          //Investigar acá como hacer para las que no son paredes para que no salte error.
          partida.partidaActual().paredesPartida().add(nuevaPared)

          //Cambio de columna
          j += 1

        })
      
      //Cambio de fila
      i+= 1

    })
  }

}

//Representa una pared que no hace nada
object pn
{
  method decodificar(fila, columna)
  {

    //La crea, la añade a la visual, y la retorna
    var nuevaPared = new ParedQueNoHaceNada(x = columna, y = fila)

    game.addVisual(nuevaPared)

    return nuevaPared
  }
}

//Representa una pared que reinicia la partida
object pr
{
  method decodificar(fila, columna)
  {
    
    //La crea, la añade a la visual, y la retorna
    var nuevaPared = new ParedQueReinicia(x = columna, y = fila)

    game.addVisual(nuevaPared)

    return nuevaPared
  }
}

//Representa un espacio en blanco, algo que NO es pared
object n
{
  method decodificar()
  {

  }
}

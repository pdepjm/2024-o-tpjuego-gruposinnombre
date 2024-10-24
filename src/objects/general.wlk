import wollok.game.*
import juego1.*
import juego2.*
import juego3.*
import screamer.*

/*-----------------------------------------------OBJETO PARTIDA, EL MÁS IMPORTANTE DE TODOS-----------------------------------------*/


object configuracion {

  var property partidaActual = partida1

  var property imagenPared = partidaActual.imagenPared()

  var property imagenManzana = partidaActual.imagenManzana()

  method personajeActual() = partidaActual.personaje()
  
  //Se usa para definir qué partida está ocurriendo en un instante determinado
  method nuevaPartida(partida) {

    partidaActual = partida

  }
  
  method personaje() = self.personajeActual()

  method matrizParedes() = partidaActual.matrizParedes()
  
  method paredes() = partidaActual.paredesPartida()

}
/*---------------------------------------------Clase de las partidas--------------------------------------------------------------------------*/

class Partida {

  var manzanasActuales = 0

  //Proxima partida a ser iniciada
  var siguientePartida

  //Imagen que tendrá la pared en toda la partida
  var property imagenPared

  var property imagenManzana

  var property personaje

  const objetivoManzanas

  const manzanasEnMapa = []


  //Matriz del mapa completo de 20x20 delimitado por paredes que no hacen nada
  const matrizParedes = []

  //Lista donde se guardan todas las paredes de la partida
  const paredes = []
  
  //Devuelve la matriz que delimita el mapa de la partida y sus paredes
  method matrizParedes() = matrizParedes

  method paredesPartida() = paredes

  //Metodo que se utiliza para iniciar el juego 1
  method iniciar(){

    //Aviso al objeto partida que comenzó la partida 1
    configuracion.nuevaPartida(self)

    //Defino el fondo background del mapa
		game.boardGround("../../assets/fondo-pasto.png") 

      //Añado el personaje
      game.addVisual(self.personaje())
        
      //Posiciono el personaje
      self.personaje().position(game.center())
    }

  //Utilizado a la hora de darle fin a la partida
  method terminar(){

    //Lo saco del mapa al personaje
    game.removeVisual(self.personaje())

    //Insertar metodo que elimine todas las paredes

    //Destruye todos los cuerpos de la serpiente
    self.personaje().destruirCuerpos()

    //Elimina a todas las manzanas del mapa, probablemente haya que modificarlo como paredes
    manzanasEnMapa.foreach({ manzana => 

        manzana.finalizar()

        manzanasEnMapa.remove(manzana)
      })
    }

    //Reinicia la partida instantaneamnete
    method reiniciar(){

        self.terminar()

        manzanasActuales = 0

        self.iniciar()
    }

    method sumarManzana(){

        manzanasActuales += 1
       
        if(manzanasActuales == objetivoManzanas)
        {

            //En este caso se debería pasar de nivel
            self.terminar()

            configuracion.nuevaPartida(siguientePartida)

            siguientePartida.iniciar()
        }
    }        
}



/*---------------------------------------------Clase general de las manzanas y paredes-------------------------------------*/
class Cosas {

  //LAS VARIABLES ESTAN DE MAS, DEBERIAMOS BORRARLAS Y PONER --> var property position = game.at(0, 0)
  var x

  var y 

  var property position = game.at(x, y)
  
  method finalizar() {

    game.removeVisual(self)

  }
}


/*---------------------------------------------Objetos relacionados con las manzanas-------------------------------------*/
class Manzana inherits Cosas {

  const imagen = "../../assets/manzana.png"
  
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

  method position() = self.personaje().position()

  method nuevaPosicion() = game.at(0,0)

  method personaje() = configuracion.personaje()



  method moverse()
  {
    self.personaje().moverCuerpos(self.position())

    self.personaje().position(self.nuevaPosicion())
  }
}

//OBJETOS
object izquierda inherits Movimiento {
  override method nuevaPosicion()  = game.at(self.personaje().position().x() - 1, self.personaje().position().y())

  method cambiarImagen() = self.personaje().image(self.personaje().imagenIzquierda())

}

object derecha inherits Movimiento {
  override method nuevaPosicion() = game.at(self.personaje().position().x() + 1, self.personaje().position().y())

  method cambiarImagen() = self.personaje().image(self.personaje().imagenDerecha())
}

object arriba inherits Movimiento {
  override method nuevaPosicion() = game.at(self.personaje().position().x(), self.personaje().position().y() + 1)

  method cambiarImagen() = self.personaje().image(self.personaje().imagenArriba())
}

object abajo inherits Movimiento {
  override method nuevaPosicion() = game.at(self.personaje().position().x(), self.personaje().position().y() - 1)

  method cambiarImagen() = self.personaje().image(self.personaje().imagenAbajo())
}

/*----------------------------------------------TODO SOBRE PAREDES-----------------------------------------------------------------------*/

/*--------------------------------------CLASES---------------------------------------------*/

class Pared inherits Cosas {

  method image() = configuracion.imagenPared()

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
    configuracion.partidaActual().reiniciar()
  }
}


/*---------------------------OBJETOS CON LOS QUE HAGO LA MATRIZ DEL MAPA------------------------------*/

object decodificadorParedes
{
  var i = 19
  var j = 0

  method decodificarParedes()
  {
    configuracion.matrizParedes().foreach({fila => 
        fila.foreach({ pared => 
          
          var nuevaPared = pared.decodificar(i, j)

          //Investigar acá como hacer para las que no son paredes para que no salte error.
          configuracion.partidaActual().paredesPartida().add(nuevaPared)

          //Cambio de columna
          j += 1

        })
      
      //Cambio de fila
      i-= 1

      //Reseteo la columna
      j = 0

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

//Representa una manzana
object mn
{
  method decodificar(fila, columna)
  {
    //La crea, la añade a la visual, y la retorna
    var nuevaManzana = new Manzana(x = columna, y = fila)

    game.addVisual(nuevaManzana)

    return nuevaManzana
  }
}


//Representa un espacio en blanco, algo que NO es pared
object n
{
  method decodificar()
  {

  }
}

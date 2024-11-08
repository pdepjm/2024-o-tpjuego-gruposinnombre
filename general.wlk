import wollok.game.*
import juego1.*
import juego2.*
import screamer.*

/*-----------------------------------------------OBJETO PARTIDA, EL MÁS IMPORTANTE DE TODOS-----------------------------------------*/
object configuracion {
  var property partidaActual = partida1
  var property imagenPared = partidaActual.imagenPared()
  var property imagenManzana = partidaActual.imagenManzana()

  method personaje() = partidaActual.personaje()
  method paredes() = partidaActual.paredes()
  method matrizParedes() = partidaActual.matrizParedes()
}
/*---------------------------------------------Clase de las partidas--------------------------------------------------------------------------*/

class Partida {
  const siguientePartida //Proxima partida a ser iniciada

  //Imagenes de la partida
  var property imagenPared
  var property imagenManzana
  var property personaje

  //Todo sobre manzanas
  const objetivoManzanas
  var property manzanasActuales
  var property manzanasEnMapa = []
  var property posicionesManzanas = []  //Guardo las posiciones para decodificarlas en el reinicio

  //todo sobre paredes
  var property matrizParedes = []
  var property paredes = []

  //Inicia la partida
  method iniciar() {
    configuracion.partidaActual(self) //Asigno la partida actual
    
	  game.addVisual(fondoDePantalla) //Agrego el fondo del mapa
    
    game.addVisual(self.personaje()) //Añado el personaje

    decodificadorParedes.decodificarParedes() //decodifica el mapa
  }
  
  //Termina la partida
  method terminar() {
  
    manzanasActuales = 0
    game.clear()
    
    //Elimina al personaje y sus cuerpos
    self.personaje().destruirCuerpos()


    configuracion.partidaActual(siguientePartida)
    siguientePartida.iniciar()
  }
  
  //Reinicia la partida instantaneamente
  method reiniciar() {
    //Reiniciar Personaje
    personaje.destruirCuerpos()
    personaje.position(personaje.posicionInicial())
    configuracion.personaje().imagen(configuracion.personaje().imagenAbajo())

    //Reiniciar manzanas
    manzanasActuales = 0
    self.posicionesManzanas().forEach({ posicion=>
        const nuevaManzana = new Manzana(x = posicion.x(), y = posicion.y())
        nuevaManzana.iniciar()
        self.posicionesManzanas().remove(posicion)
    })
  }
  
  method sumarManzana() {
    manzanasActuales += 1
    
    if (manzanasActuales == objetivoManzanas) {

      self.terminar()
      
      //configuracion.partidaActual(siguientePartida) //Pasar de nivel
      
      //siguientePartida.iniciar()
    }
  }
}
/*---------------------------------------------Clase general de las manzanas y paredes-------------------------------------*/

class Cosas {
  const x
  const y
  var property position = game.at(x, y)
  
  method iniciar(){
    game.addVisual(self)
  }

  method finalizar() {
    game.removeVisual(self)
  }
}
/*---------------------------------------------Objetos relacionados con las manzanas-------------------------------------*/

class Manzana inherits Cosas {
  const imagen = "manzana.png"
  
  method image() = imagen
  
  override method iniciar() {
    super()
    game.whenCollideDo(self,{ personaje => personaje.interactuarManzana(self) })
  }
}
/*------------------------Objetos relacionados con las direcciones y los movimientos de los personajes------------------------------------*/

//PRUEBA DE HERENCIA CON LOS MOVIMIENTOS
//SUPERCLASE
class Movimiento {
  method position() = self.personaje().position()
  
  method nuevaPosicion() = game.at(0, 0)
  
  method personaje() = configuracion.personaje()
  
  //USAR override para la funcion moverse al definir a santi
  method moverse() {
    if (self.personaje() == santi) santi.crecer()
    
    self.personaje().moverCuerpos(self.position())
    
    self.personaje().position(self.nuevaPosicion())
  }
} //OBJETOS

object izquierda inherits Movimiento {
  override method nuevaPosicion() = game.at(
    self.personaje().position().x() - 1,
    self.personaje().position().y()
  )
}

object derecha inherits Movimiento {
  override method nuevaPosicion() = game.at(
    self.personaje().position().x() + 1,
    self.personaje().position().y()
  )
  }


object arriba inherits Movimiento {
  override method nuevaPosicion() = game.at(
    self.personaje().position().x(),
    self.personaje().position().y() + 1
  )
}

object abajo inherits Movimiento {
  override method nuevaPosicion() = game.at(
    self.personaje().position().x(),
    self.personaje().position().y() - 1
  )
}
/*----------------------------------------------TODO SOBRE PAREDES-----------------------------------------------------------------------*/

/*--------------------------------------CLASES---------------------------------------------*/
class Pared inherits Cosas {
  method image() = configuracion.imagenPared()
  
  override method iniciar() {
    super()
    game.whenCollideDo(self, { personaje => personaje.interactuarPared() })    
  }
}

class ParedQueNoHaceNada inherits Pared {
  method interactuarPersona() {
    
  }
}

class ParedQueReinicia inherits Pared {
  method interactuarPersona() {
    configuracion.partidaActual().reiniciar()
  }
}
/*---------------------------OBJETOS CON LOS QUE HAGO EL MAPA------------------------------*/
object fondoDePantalla {
		var property position = game.at(0, 0)
		method image() = "fondo-pasto.png"
    method interactuarPared() {
      
    }
	}

object decodificadorParedes {
  var i = 17
  var j = 0
  
  method decodificarParedes() {
    configuracion.matrizParedes().forEach
    (
    { 
      fila =>
        fila.forEach(
          { pared => 
            
            if (pared == pn || pared == pr)
            {
              const nuevaPared = pared.decodificar(i, j)
              configuracion.partidaActual().paredes().add(nuevaPared)

            } 
            else
            {
              if(pared == mn)
              {
                const nuevaManzana = pared.decodificar(i,j)
                configuracion.partidaActual().manzanasEnMapa().add(nuevaManzana)
              }
            }


            //Cambio de columna
            j += 1
          }
        ) 
        
        //Cambio de fila
        i -= 1
        
        //Reseteo la columna
        j = 0
      }
    )
  }
} 

//Representa una pared que no hace nada
object pn {
  method decodificar(fila, columna) 
  {
    const nuevaPared = new ParedQueNoHaceNada(x = columna, y = fila)
    
    nuevaPared.iniciar()
    
    return nuevaPared
  }
} 

//Representa una pared que reinicia la partida
object pr {
  method decodificar(fila, columna) {
    const nuevaPared = new ParedQueReinicia(x = columna, y = fila)
    
    nuevaPared.iniciar()
    
    return nuevaPared
  }
} 

//Representa una manzana
object mn {
  method decodificar(fila, columna) {
    const nuevaManzana = new Manzana(x = columna, y = fila)
    
    nuevaManzana.iniciar()
    
    return nuevaManzana
  }
} 

//Representa un espacio en blanco
object n {
  method decodificar() {
    
  }
}
/*------------------------------------------Clase de los cuerpos---------------------------------*/

class Cuerpo {
  var property position
  const imagen = "cuerpo.png" 
  
  method image() = imagen
  
  method iniciar() {
    game.whenCollideDo(self, { personaje => personaje.interactuarCuerpo() })
    game.addVisual(self)
  }

  method finalizar() {
    self.position(game.at(24, 24))
    game.removeVisual(self)
  }

  method interactuarCuerpo(){}
  method interactuarManzana(manzana){}
}

/*------------------------------------------Objeto fin del juego---------------------------------*/

object fin {
  
}
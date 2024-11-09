import wollok.game.*
import juego1.*
import juego2.*
import screamer.*

/*-----------------------------------------------OBJETO PARTIDA, EL MÁS IMPORTANTE DE TODOS-----------------------------------------*/
object configuracion {
  var property partidaActual = partida2
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

  //Reinicia la partida instantaneamente terminar
  method reiniciar() {
    personaje.reiniciarPersonaje() //Reiniciar Personaje

    self.reiniciarManzanas() //Reiniciar manzanas
  }

    //Termina la partida
  method pasarDeNivel() {
    manzanasActuales = 0
    game.clear()
    
    personaje.destruirCuerpos() //Elimina al personaje y sus cuerpos

    configuracion.partidaActual(siguientePartida)
    siguientePartida.iniciar()
  }
  
  method sumarManzana() {
    manzanasActuales += 1
    
    if (manzanasActuales == objetivoManzanas) {
      self.pasarDeNivel()
    }
  }
  
  //Reinicia las manzanas y el contador
  method reiniciarManzanas() {
    manzanasActuales = 0
    posicionesManzanas.forEach({ posicion =>
        const nuevaManzana = new Manzana(x = posicion.x(), y = posicion.y())
        nuevaManzana.iniciar()
    })
    posicionesManzanas.clear()
  }
}

/*---------------------------------------------Clase de los personajes-------------------------------------*/

class Personaje {
  const cuerpos = []
  const posicionInicial

  var property position = posicionInicial
  var property posicionProximoCuerpo = position

  //Animaciones
  var property imagen = "cabeza-abajo.png"

  method image() = imagen
  method imagenAbajo() = "cabeza-abajo.png"
  method imagenArriba() = "cabeza-arriba.png"
  method imagenDerecha() = "cabeza-derecha.png"
  method imagenIzquierda() = "cabeza-izquierda.png"

  //Destruye todos los cuerpos de la serpiente
  method destruirCuerpos(){
      cuerpos.forEach({ cuerpo => cuerpo.finalizar() })
      cuerpos.clear()
  }

  //Devuelve al personaje a su estado inicial
  method reiniciarPersonaje() {
    self.destruirCuerpos()
    self.position(posicionInicial)
    imagen = self.imagenAbajo()
  }

  //Permite que los juegos sigan al personaje
  method moverCuerpos(posicionAnteriorCabeza){
    if(cuerpos != []){
      self.posicionProximoCuerpo(cuerpos.last().position()) //Guardo la posicion donde se guardará el proximo cuerpo en caso de añadir uno

      var viejaPosicion = posicionAnteriorCabeza

      var nuevaViejaPosicion

      cuerpos.forEach({ cuerpo =>

          nuevaViejaPosicion = cuerpo.position()  //Guardo la posicion del cuerpo actual

          cuerpo.position(viejaPosicion) //Reemplazo la posicion del cuerpo actual, con la del cuerpo o cabeza anterior

          //Guardo la vieja posicion de este cuerpo para saber donde mover al proximo en la lista
          viejaPosicion = nuevaViejaPosicion 
      })
    }
  }

  //Interactua con la manzana el personaje
  method interactuarManzana(manzana){
    configuracion.partidaActual().posicionesManzanas().add(manzana.position()) // se guarda la posicion en caso de reinicio
    configuracion.partidaActual().sumarManzana()
    manzana.position(game.at(24, 24))
    manzana.finalizar()
  }

  //Le agrega un bloque mas al cuerpo
  method crecer(){
    const nuevoCuerpo = new Cuerpo(position = self.posicionProximoCuerpo())

    nuevoCuerpo.iniciar()

    cuerpos.add(nuevoCuerpo)
  }

  //Si choca consigo mismo reinicia
  method interactuarCuerpo(){
    configuracion.partidaActual().reiniciar()
  } 
}
/*------------------------Objetos relacionados con las direcciones y los movimientos de los personajes------------------------------------*/
class Movimiento {
  method personaje() = configuracion.personaje()
  method position() = self.personaje().position()
  method nuevaPosicion() = self.position()

   //USAR override para la funcion moverse al definir a santi
    method moverse() {
      if (self.personaje() == santi) santi.crecer()

      self.personaje().moverCuerpos(self.position())

      self.personaje().position(self.nuevaPosicion())
    } 
} 

  /*
  NO TOCAR FORMA PARTE DEL NUEVO METODO DE MOVIMIENTO
  method puedeMoverseA(posicionX, posicionY) {
    const objetoMatriz = configuracion.matrizParedes().get(posicionX).get(posicionY)
    
    if(objetoMatriz != pn){
      configuracion.personaje().posicionProximoCuerpo(configuracion.personaje().position())
      self.nuevaPosicion()
    }	
  }
  */

//OBJETOS
//Estos podrian ser metodos de la clase personaje, asi SANTI PUEDE HACER OVERRIDE

object izquierda inherits Movimiento {
  override method nuevaPosicion() = super().left(1)
}

object derecha inherits Movimiento {
  override method nuevaPosicion() = super().right(1)
  }

object arriba inherits Movimiento {
  override method nuevaPosicion() = super().up(1)
}

object abajo inherits Movimiento {
  override method nuevaPosicion() = super().down(1)
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
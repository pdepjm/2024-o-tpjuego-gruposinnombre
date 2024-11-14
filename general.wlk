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
  method visuales() = partidaActual.visuales()
  method matrizVisuales() = partidaActual.matrizVisuales()
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
  var property matrizVisuales = []
  var property visuales = []   

  //Inicia la partida
  method iniciar() {
    manzanasActuales = 0

    game.addVisual(fondoDePantalla) //Agrego el fondo del mapa
    
    game.addVisual(self.personaje()) //Añado el personaje

    decodificador.decodificarVisuales() //decodifica el mapa
  }

  //Reinicia la partida instantaneamente terminar
  method reiniciar() {
    personaje.reiniciarPersonaje() //Reiniciar Personaje

    self.reiniciarManzanas() //Reiniciar manzanas
  }

    //Termina la partida
  method pasarDeNivel() {
    game.allVisuals().forEach({visual=> game.removeVisual(visual)})
    configuracion.partidaActual().personaje().destruirCuerpos()
    configuracion.partidaActual().personaje().posicionProximoCuerpo(game.at(24,24))
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

  method imagenAbajo(){ self.imagen("cabeza-abajo.png") }
  method imagenArriba(){ self.imagen("cabeza-arriba.png") }
  method imagenDerecha(){ self.imagen("cabeza-derecha.png") }
  method imagenIzquierda(){ self.imagen("cabeza-izquierda.png") }

  method moverseA(direccion) {
		self.posicionProximoCuerpo(self.position())
    direccion.moverse()
  }

  //Destruye todos los cuerpos de la serpiente
  method destruirCuerpos(){
      cuerpos.forEach({ cuerpo => 
        cuerpo.finalizar()
      })
      cuerpos.clear()
  }

  //Devuelve al personaje a su estado inicial
  method reiniciarPersonaje() {
    self.destruirCuerpos()
    self.position(posicionInicial)
    self.imagenAbajo()
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
    game.sound("sonidoComer.mp3").play()
    configuracion.partidaActual().posicionesManzanas().add(manzana.position()) // se guarda la posicion en caso de reinicio
    manzana.position(game.at(24, 24))
    manzana.finalizar()
    configuracion.partidaActual().sumarManzana()
  }

  //Le agrega un bloque mas al cuerpo
  method crecer(){
    const nuevoCuerpo = new Cuerpo(position = self.posicionProximoCuerpo())

    nuevoCuerpo.iniciar()

    cuerpos.add(nuevoCuerpo)
  }

  /*
    method crecer(){
    // const posicionSiguiente = self.proximaPosicion()
    const nuevoCuerpo = new Cuerpo(position = posicionSiguiente)

    nuevoCuerpo.iniciar()
    cuerpos.add(nuevoCuerpo)
   }

   method proximaPosicion() = if(cuerpos.size() > 0) cuerpos.last().position() else position
  */

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
    self.personaje().moverCuerpos(self.position())
    self.personaje().position(self.nuevaPosicion())
  } 
}
/*
  zona.intentarSerRecorridaPor(entidad) Entidad -> puede ser un grupo o individuo 
  method intentarSerRecorridaPor(entidad) {
  

  }
  personaje.moverseA(arriba) -> vos tenes que como queda el persona
*/
object izquierda inherits Movimiento {
  override method nuevaPosicion() = super().left(1)
  override method moverse() {
    super()
    self.personaje().imagenIzquierda()
  }
}
object derecha inherits Movimiento {
  override method nuevaPosicion() = super().right(1)
  override method moverse() {
    super()
    self.personaje().imagenDerecha()
  }
  }

object arriba inherits Movimiento {
  override method nuevaPosicion() = super().up(1)
    override method moverse() {
    super()
    self.personaje().imagenArriba()
  }
}
object abajo inherits Movimiento {
  override method nuevaPosicion() = super().down(1)
    override method moverse() {
    super()
    self.personaje().imagenAbajo()
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

  method interactuarManzana(manzana) {}
  method interactuarCuerpo() {}

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
class ParedQueNoHaceNada inherits Cosas {
  method image() = configuracion.imagenPared()
}

class ParedQueReinicia inherits Cosas {
  method image() = configuracion.imagenPared()

  override method iniciar() {
    super()
    game.whenCollideDo(self,{ personaje => personaje.reiniciarPersonaje() })
  }
}
/*---------------------------OBJETOS CON LOS QUE HAGO EL MAPA------------------------------*/
object fondoDePantalla {
		var property position = game.at(0, 0)
		method image() = "fondo-pasto.png"
    method reiniciarPersonaje() {}
	}

object decodificador {
  var i = 17
  var j = 0
  
  method decodificarVisuales() {
    configuracion.matrizVisuales().forEach({ fila =>
        fila.forEach({ visual => visual.decodificar(i, j)
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
    //devuelvo la i y la j a sus valores iniciales
    i = 17
    j = 0
  }
} 

//Representa una pared que no hace nada
object pn {
  method decodificar(fila, columna) 
  {
    const nuevaPared = new ParedQueNoHaceNada(x = columna, y = fila)
    
    nuevaPared.iniciar()
    
    configuracion.partidaActual().visuales().add(nuevaPared)
    return nuevaPared
  }

  method puedeSerAtravesado() = false 

} 

//Representa una pared que reinicia la partida
object pr {
  method decodificar(fila, columna) {
    const nuevaPared = new ParedQueReinicia(x = columna, y = fila)
    
    nuevaPared.iniciar()

    configuracion.partidaActual().visuales().add(nuevaPared)
    
    return nuevaPared
  }

  method puedeSerAtravesado() = true 

} 

//Representa una manzana
object mn {
  method decodificar(fila, columna) {
    const nuevaManzana = new Manzana(x = columna, y = fila)
    
    nuevaManzana.iniciar()

    configuracion.partidaActual().visuales().add(nuevaManzana)
    
    return nuevaManzana
  }

  method puedeSerAtravesado() = true 

} 

//Representa un espacio en blanco
object n {
  method decodificar(fila, columna) {}
  method puedeSerAtravesado() = true 
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

  method interactuarManzana(manzana){}
  method interactuarCuerpo(){}
}
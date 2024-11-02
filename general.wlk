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

  method personaje() = partidaActual.personaje()

  //Se usa para definir qué partida está ocurriendo en un instante determinado
  method nuevaPartida(partida) {
    partidaActual = partida
  }
  
  method matrizParedes() = partidaActual.retornarMatriz()
  
  method paredes() = partidaActual.paredesPartida()
}
/*---------------------------------------------Clase de las partidas--------------------------------------------------------------------------*/

class Partida {
  //Todo sobre manzanas
  var manzanasActuales = 0
  const objetivoManzanas
  const manzanasEnMapa = []
  
  const siguientePartida //Proxima partida a ser iniciada
  //Imagenes de la partida
  var property imagenPared
  var property imagenManzana
  var property personaje

  const matrizParedes = [] //Matriz del mapa completo de 20x20
  const paredes = [] //Lista de objetos pared de la partida --> creo que no hace falta
  
  method retornarMatriz() = matrizParedes

  method retornarManzanasEnMapa() = manzanasEnMapa

  method paredesPartida() = paredes

  //Inicia la partida
  method iniciar() {
    configuracion.nuevaPartida(self) //Le asigno al objeto configuracion cual es su partida actual

    game.boardGround("fondo-pasto.png") //Defino el fondo del mapa --> SI REFRESCO LA PAGINA LO APLICA
    
    game.addVisual(self.personaje()) //Añado el personaje --> LO TOMA

    decodificadorParedes.decodificarParedes()
  }
  
  //Termina la partida
  method terminar() {
    
    game.removeVisual(self.personaje()) //Saca el personaje del mapa

    //Insertar metodo que elimine todas las paredes
    
    
    self.personaje().destruirCuerpos() //Destruye todos los cuerpos de la serpiente
    
    //Elimina a todas las manzanas del mapa, probablemente haya que modificarlo como paredes
    manzanasActuales = 0
    manzanasEnMapa.forEach(
      { manzana =>
        manzana.finalizar()
        manzanasEnMapa.remove(manzana)
      }
    )
  }
  
  //Reinicia la partida instantaneamente
  method reiniciar() {
    self.terminar()
    
    manzanasActuales = 0
    
    self.iniciar()
  }
  
  method sumarManzana() {
    manzanasActuales += 1
    
    if (manzanasActuales == objetivoManzanas) {

      self.terminar()
      
      configuracion.nuevaPartida(siguientePartida) //Pasar de nivel
      
      siguientePartida.iniciar()
    }
  }
}
/*---------------------------------------------Clase general de las manzanas y paredes-------------------------------------*/

class Cosas {
  const x
  const y
  var property position = game.at(x, y)
  
  method finalizar() {
    game.removeVisual(self)
  }
}
/*---------------------------------------------Objetos relacionados con las manzanas-------------------------------------*/

class Manzana inherits Cosas {
  const imagen = "manzana.png"
  
  method image() = imagen
  
  method iniciar() {
    game.whenCollideDo(
      self,
      { personaje => personaje.interactuarManzana(self) }
    )
    
    game.addVisual(self)
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
  method moverse() 
  {
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
  
  method cambiarImagen() = self.personaje().image(
    self.personaje().imagenIzquierda()
  )
}

object derecha inherits Movimiento {
  override method nuevaPosicion() = game.at(
    self.personaje().position().x() + 1,
    self.personaje().position().y()
  )
  
  method cambiarImagen() = configuracion.personaje().image(self.personaje().imagenDerecha())
}


object arriba inherits Movimiento {
  override method nuevaPosicion() = game.at(
    self.personaje().position().x(),
    self.personaje().position().y() + 1
  )
  
  method cambiarImagen() = self.personaje().image(
    self.personaje().imagenArriba()
  )
}

object abajo inherits Movimiento {
  override method nuevaPosicion() = game.at(
    self.personaje().position().x(),
    self.personaje().position().y() - 1
  )
  
  method cambiarImagen() = self.personaje().image(
    self.personaje().imagenAbajo()
  )
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

class ParedQueNoHaceNada inherits Pared {
  method interactuarPersona() {
    
  }
}

class ParedQueReinicia inherits Pared {
  method interactuarPersona() {
    configuracion.partidaActual().reiniciar()
  }
}
/*---------------------------OBJETOS CON LOS QUE HAGO LA MATRIZ DEL MAPA------------------------------*/

object decodificadorParedes {
  var i = 19
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
              configuracion.partidaActual().paredesPartida().add(nuevaPared)

            } 
            else
            {
              if(pared == mn)
              {
                const nuevaManzana = pared.decodificar(i,j)
                configuracion.partidaActual().retornarManzanasEnMapa().add(nuevaManzana)
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
    //La crea, la añade a la visual, y la retorna
    const nuevaPared = new ParedQueNoHaceNada(x = columna, y = fila)
    
    nuevaPared.iniciar()
    
    return nuevaPared
  }
} //Representa una pared que reinicia la partida

object pr {
  method decodificar(fila, columna) {
    //La crea, la añade a la visual, y la retorna
    const nuevaPared = new ParedQueReinicia(x = columna, y = fila)
    
    nuevaPared.iniciar()
    
    return nuevaPared
  }
} //Representa una manzana

object mn {
  method decodificar(fila, columna) {
    //La crea, la añade a la visual, y la retorna
    const nuevaManzana = new Manzana(x = columna, y = fila)
    
    nuevaManzana.iniciar()
    
    return nuevaManzana
  }
} //Representa un espacio en blanco, algo que NO es pared

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
}

/*------------------------------------------Objeto fin del juego---------------------------------*/

object fin {
  
}
import wollok.game.*
import juego1.*
import screamer.*
import general.*

const partida2 = new Partida( 
  siguientePartida = partida3, 
  imagenPared = "pared-tierra.png",
  personaje = santi,
  imagenManzana = "imagenManzana",
  objetivoManzanas = 1, 
  //ESTE MAPA YA ESTA BIEN HECHO
  matrizParedes = [
    [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn],  //fila 19
    [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, mn,  n,  n,  n,  n, mn,  n, pn, pn, pn],  // fila 18
    [pn, pn,  n,  n,  n,  n,  n,  n, pn, pn,  n, pn, pn, pn, mn,  n,  n, pn, pn, pn],  // fila 17
    [pn, pn,  n, mn, mn, pn, pn,  n, pn, pn,  n, pn, pn, pn, pn,  n,  n, pn, pn, pn],  // fila 16
    [pn, pn,  n,  n, mn, pn, pn,  n, pn, pn,  n,  n,  n, pn, pn,  n,  n, pn, pn, pn],  // fila 15
    [pn, pn,  n, pn, pn,  n,  n,  n, pn, pn, pn, pn,  n, pn, mn,  n,  n, pn, pn, pn],  // fila 14
    [pn, pn,  n, pn, pn, mn,  n,  n, pn, pn,  n,  n,  n, pn,  n,  n,  n, mn, pn, pn],  // fila 13
    [pn, pn,  n,  n, mn, pn, pn,  n, pn, pn,  n, pn, pn, pn, pn, pn, pn, pn, pn, pn],  // fila 12
    [pn, pn, pn, pn,  n, pn, pn,  n, pn, pn,  n, pn,  n,  n,  n,  n,  n,  n,  n, pn],  // fila 11
    [pn, pn,  n,  n,  n, pn, pn,  n,  n,  n,  n, pn,  n, pn, pn, pn, pn, pn,  n, pn],  // fila 10
    [pn, pn,  n, pn, pn, pn, pn, pn,  n,  n,  n,  n,  n, pn, pn,  n,  n,  n,  n, pn],  // fila 9
    [pn, pn,  n, pn, pn, pn, pn,  n,  n,  n,  n,  n,  n, pn, pn,  n, pn, pn, pn, pn],  // fila 8
    [pn, pn,  n, pn, pn, pn, pn,  n, pn,  n, pn, pn,  n,  n, pn,  n, pn, pn, pn, pn],  // fila 7
    [pn, pn,  n,  n,  n,  n,  n,  n, pn,  n, pn, pn, pn,  n, pn,  n,  n,  n,  n, pn],  // fila 6
    [pn, pn,  n, pn, pn, pn, pn, pn, pn,  n,  n, mn, pn,  n, pn, pn, pn, pn,  n, pn],  // fila 5
    [pn, pn, pn, pn, pn, pn,  n,  n,  n,  n, pn,  n, pn,  n, pn, pn, pn, pn,  n, pn],  // fila 4
    [pn,  n,  n,  n,  n,  n,  n,  n, pn,  n, pn,  n, pn,  n, pn, mn,  n, pn,  n, pn],  // fila 3
    [pn,  n, mn, pn, pn,  n,  n,  n, pn,  n,  n,  n, pn,  n,  n,  n,  n,  n,  n, pn],  // fila 2
    [pn,  n,  n, pn, pn, pn,  n, mn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn],  // fila 1
    [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn]],
    manzanasActuales = 0
)

object santi {
  const cuerpos = []

  var property posicionProximoCuerpo = position

  var property position = game.at(1,1)

  const imagen = "cabeza-abajo.png"

    method imagenAbajo ()= "cabeza-abajo.png"
    method imagenArriba ()= "cabeza-arriba.png"
    method imagenDerecha ()= "cabeza-derecha.png"
    method imagenIzquierda ()= "cabeza-izquierda.png"

  method image() = imagen
  
  method iniciar() {
    game.addVisualCharacter(self)
  }

  method interactuarPared(){
    //no pongo nada porque quiero que se quede en su posicion actual
  }

  method interactuarManzana(manzana){
    manzana.desaparecer()

    partida2.sumarManzana()
  }

 method destruirCuerpos()
    {

        cuerpos.forEach
        ({cuerpo =>

            game.removeVisual(cuerpo)

            cuerpos.remove(cuerpo)

        })
    }

    method crecer(){
        //Lo crea, lo inicia, y lo añade
        const nuevoCuerpo = new Cuerpo(position = posicionProximoCuerpo)

        nuevoCuerpo.iniciar()

        cuerpos.add(nuevoCuerpo)

    }

  method moverCuerpos(posicionAnteriorCabeza)
    {

        //Guardo la posicion donde se guardará el proximo cuerpo en caso de añadir uno
        if(cuerpos !=[])
        {
        self.posicionProximoCuerpo(cuerpos.last().position()) 

        var viejaPosicion = posicionAnteriorCabeza

        var nuevaViejaPosicion

        //Desplazo todos los cuerpos de la lista de cuerpos
        cuerpos.forEach({ cuerpo =>

            //Guardo la posicion del cuerpo actual
            nuevaViejaPosicion = cuerpo.position()

            //Reemplazo la posicion del cuerpo actual, con la del cuerpo o cabeza anterior
            cuerpo.position(viejaPosicion)

            //Guardo la vieja posicion de este cuerpo para saber donde mover al proximo en la lista
            viejaPosicion = nuevaViejaPosicion    
        })}
    }
}
import wollok.game.*
import juego2.*
import general.*

//partida1 hecha a partir de la clase Partida
const partida1 = new Partida(
    siguientePartida = partida2,  
    imagenPared = "pared-tierra.png", 
    personaje = cabeza,
    imagenManzana = "manzana.png",
    objetivoManzanas = 3, 
    matrizParedes = [
        [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn],  // fila 0
        [pn,  n,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, mn,  n, pn],  // fila 1
        [pn,  n, mn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn,  n,  n, pn],  // fila 2
        [pn,  n,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn,  n, pn, pn],  // fila 3
        [pn,  n,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn,  n, pn, pn],  // fila 4
        [pn,  n,  n,  n, mn, mn,  n,  n,  n,  n,  n,  n,  n,  n, pn,  n, mn, pn],  // fila 5
        [pn, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, mn,  n, pn],  // fila 6
        [pn, mn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n, pn],  // fila 7
        [pn,  n,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n, pn],  // fila 8
        [pn,  n,  n, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn],  // fila 9
        [pn,  n,  n, mn, pn, pn,  n,  n,  n,   n, n,   n, n,  n,  n,  n,  n, pn],  // fila 10
        [pn,  n,  n,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn],  // fila 11
        [pn, pn, pn,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn],  // fila 12
        [pn, pn, pn, mn, pn, pn, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n, pn],  // fila 13
        [pn, pn,  n,  n,  n,  n,  n,  n, pn,  n,  n,  n,  n, pn, pn, pn, pn, pn],  // fila 14
        [pn,  n,  n,  n, pn, pn,  n,  n, pn,  n,  n,  n,  n, pn,  n,  n,  n, pn],  // fila 15
        [pn,  n,  n, mn, pn, pn,  n, mn, pn,  n,  n,  n,  n,  n,  n,  n, mn, pn],  // fila 16
        [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn]], // fila 17
        manzanasActuales = 0
)

object cabeza {

    const cuerpos = []

    var property posicionProximoCuerpo = position

    var property position = game.at(1,16)

    var property imagen = "cabeza-abajo.png"

    method image() = imagen

    method retornarCuerpos() = cuerpos

    method imagenAbajo ()= "cabeza-abajo.png"
    method imagenArriba ()= "cabeza-arriba.png"
    method imagenDerecha ()= "cabeza-derecha.png"
    method imagenIzquierda ()= "cabeza-izquierda.png"


    //Destruye todos los cuerpos de la serpiente
    method destruirCuerpos(){
        cuerpos.forEach( {cuerpo => 

            cuerpo.position(game.at(24, 24))
            game.removeVisual(cuerpo)
            cuerpos.remove(cuerpo)
        
        } )
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
    //Interactua con la manzana el personaje (hay que modificarlo como a las paredes)
    method interactuarManzana(manzana){
        
        configuracion.partidaActual().posicionesManzanas().add(manzana.position())

        manzana.position(game.at(24, 24))
        manzana.finalizar()
        
        partida1.sumarManzana()

        self.crecer()
    }

    //Metodo que se utiliza cada vez que la serpiente come una manzana, por lo tanto crece en un cuerpo
    method crecer(){

        //Lo crea, lo inicia, y lo añade
        const nuevoCuerpo = new Cuerpo(position = self.posicionProximoCuerpo())

        nuevoCuerpo.iniciar()

        cuerpos.add(nuevoCuerpo)

    }

    method interactuarCuerpo(){
        partida1.reiniciar()
    } 
}

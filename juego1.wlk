import wollok.game.*
import juego2.*
import general.*

//partida1 hecha a partir de la clase Partida
const partida1 = new Partida(
    siguientePartida = partida2,  
    imagenPared = "pared-tierra.png", 
    personaje = cabeza,
    imagenManzana = "manzana.png",
    objetivoManzanas = 5, 
    matrizParedes = [
        [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn],  // fila 0
        [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn],  // fila 1
        [pn, pn,  n,  n, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n,  n, pn, pn],  // fila 2
        [pn, pn,  n,  n, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n,  n, pn, pn],  // fila 3
        [pn, pn,  n,  n, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n, pn, pn, pn],  // fila 4
        [pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n, pn, pn, pn],  // fila 5
        [pn, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n,  n, pn, pn],  // fila 6
        [pn, pn, pn, pn,  n,  n,  n,  n,  n,  n, pn, pn, pn, pn, pn, pn,  n,  n, pn, pn],  // fila 7
        [pn, pn,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn, pn, pn, pn, pn, pn,  n, pn, pn],  // fila 8
        [pn, pn,  n,  n, pn,  n,  n,  n,  n,  n, pn, pn, pn, pn, pn, pn, pn,  n, pn, pn],  // fila 9
        [pn, pn,  n,  n, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 10
        [pn, pn,  n,  n,  n, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 11
        [pn, pn,  n,  n,  n, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 12
        [pn, pn, pn, pn,  n, pn, pn, pn, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 13
        [pn, pn, pn, pn,  n, pn, pn, pn, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 14
        [pn, pn, pn,  n,  n,  n,  n,  n,  n, pn, pn,  n,  n,  n, pn, pn, pn, pn, pn, pn],  // fila 15
        [pn, pn,  n,  n,  n, pn, pn,  n,  n, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 16
        [pn, pn,  n,  n,  n, pn, pn,  n,  n, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 17
        [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn],  // fila 18
        [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn]]
)

object cabeza {

    const cuerpos = []

    var posicionProximoCuerpo = position

    var property position = game.at(1,1)

    const imagen = "cabeza-abajo.png"

    method image() = imagen

    method imagenIzquierda ()= "cabeza-izquierda.png"

    method imagenDerecha ()= "cabeza-derecha.png"

    method imagenArriba ()= "cabeza-arriba.png"

    method imagenAbajo ()= "cabeza-abajo.png"


    //Destruye todos los cuerpos de la serpiente
    method destruirCuerpos()
    {

        cuerpos.forEach
        ({cuerpo =>

            game.removeVisual(cuerpo)

            cuerpos.remove(cuerpo)

        })
    }

    method moverCuerpos(posicionAnteriorCabeza)
    {

        //Guardo la posicion donde se guardará el proximo cuerpo en caso de añadir uno
        if(cuerpos !=[]){
        posicionProximoCuerpo = cuerpos.last().position()

        var viejaPosicion = posicionAnteriorCabeza

        var nuevaViejaPosicion

        //Desplazo todos los cuerpos de la lista de cuerpos
        cuerpos.foreach({ cuerpo =>

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

        manzana.finalizar()

        partida1.sumarManzana()

        self.crecer()
    }

    //Metodo que se utiliza cada vez que la serpiente come una manzana, por lo tanto crece en un cuerpo
    method crecer(){

        //Lo crea, lo inicia, y lo añade
        const nuevoCuerpo = new Cuerpo(position = posicionProximoCuerpo)

        nuevoCuerpo.iniciar()

        cuerpos.add(nuevoCuerpo)

    }

    method interactuarCuerpo(){
        partida1.reiniciar()
    } 
}

/* VIEJO OBJETO partida1
object partida1{
    
    method personaje() = cabeza

    //Todo sobre las manzanas
    const objetivoManzanas = 5

    const manzanasEnMapa = []
    
    method imagenManzana() = "manzana.png"

    //Matriz del mapa completo de 20x20 delimitado por paredes que no hacen nada
    const matrizParedes = [
        [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn],  // fila 0
        [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn],  // fila 1
        [pn, pn,  n,  n, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n,  n, pn, pn],  // fila 2
        [pn, pn,  n,  n, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n,  n, pn, pn],  // fila 3
        [pn, pn,  n,  n, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n, pn, pn, pn],  // fila 4
        [pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n, pn, pn, pn],  // fila 5
        [pn, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn,  n,  n, pn, pn],  // fila 6
        [pn, pn, pn, pn,  n,  n,  n,  n,  n,  n, pn, pn, pn, pn, pn, pn,  n,  n, pn, pn],  // fila 7
        [pn, pn,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn, pn, pn, pn, pn, pn,  n, pn, pn],  // fila 8
        [pn, pn,  n,  n, pn,  n,  n,  n,  n,  n, pn, pn, pn, pn, pn, pn, pn,  n, pn, pn],  // fila 9
        [pn, pn,  n,  n, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 10
        [pn, pn,  n,  n,  n, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 11
        [pn, pn,  n,  n,  n, pn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 12
        [pn, pn, pn, pn,  n, pn, pn, pn, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 13
        [pn, pn, pn, pn,  n, pn, pn, pn, pn, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 14
        [pn, pn, pn,  n,  n,  n,  n,  n,  n, pn, pn,  n,  n,  n, pn, pn, pn, pn, pn, pn],  // fila 15
        [pn, pn,  n,  n,  n, pn, pn,  n,  n, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 16
        [pn, pn,  n,  n,  n, pn, pn,  n,  n, pn, pn,  n,  n,  n,  n,  n,  n,  n, pn, pn],  // fila 17
        [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn],  // fila 18
        [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn] ]


    //Lista donde se guardan todas las paredes de la partida
    const paredes = []

    //Devuelve la matriz que delimita el mapa de la partida y sus paredes
    method matrizParedes() = matrizParedes

    method paredesPartida() = paredes

    //Imagen que tendrá la pared en toda la partida
    method imagenPared() = "pared-tierra.png" 

    var manzanasActuales = 0

    //Metodo que se utiliza para iniciar el juego 1
    method iniciar(){

        //Aviso al objeto partida que comenzó la partida 1
        configuracion.nuevaPartida(self)

        //Defino el fondo background del mapa
		game.boardGround("fondo-pasto.png") 

        //Añado el personaje
        game.addVisual(cabeza)
        
        //Posiciono el personaje
        cabeza.position(game.center())

    }

    //Utilizado a la hora de darle fin a la partida
    method terminar()
    {

        //Lo saco del mapa al personaje
        game.removeVisual(cabeza)

        //Insertar metodo que elimine todas las paredes

        //Destruye todos los cuerpos de la serpiente
        cabeza.destruirCuerpos()

        //Elimina a todas las manzanas del mapa, probablemente haya que modificarlo como paredes
        manzanasEnMapa.foreach({ manzana => 

            manzana.finalizar()

            manzanasEnMapa.remove(manzana)
        })
    }

    method reiniciar(){

        self.terminar()

        manzanasActuales = 0

        self.iniciar()
    }

    method sumarManzana(){

        manzanasActuales ++
       
        if(manzanasActuales == objetivoManzanas)
        {

            //En este caso se debería pasar de nivel
            self.terminar()

            configuracion.nuevaPartida(partida2)

            partida2.iniciar()
        }
    }
    
}
*/
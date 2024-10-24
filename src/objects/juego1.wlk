import wollok.game.*
import juego2.*
import general.*

object partida1{
    
    method personaje() = cabeza

    //Todo sobre las manzanas
    const objetivoManzanas = 5

    const manzanasEnMapa = []
    
    method imagenManzana() = "../../assets/manzana.png"

    //Matriz del mapa completo de 20x20 delimitado por paredes que no hacen nada
    const matrizParedes = [
      [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn], // Fila 0
      [n,  n,  n,  n, n, n, n, n, n, n, n, n, n, n, n, n, n, n, n, pn], // Fila 1
      [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, n, pn, pn], // Fila 2
      [n,  n,  n,  n, n, n, n, n, n, n, n, n, n, n, n, n, pn, n, n, pn], // Fila 3
      [n,  n,  n,  n, n, n, n, n, n, n, n, n, n, n, n, n, pn, pn, n, pn], // Fila 4
      [n,  n,  n,  n, n, n, n, n, n, n, n, n, pn, pn, pn, pn, pn, n, n, pn], // Fila 5
      [n,  n,  n,  n, n, n, n, n, n, n, n, n, pn, n, n, n, n, n, pn, pn], // Fila 6
      [n,  n,  n,  n, n, n, n, n, n, n, n, n, pn, n, pn, pn, pn, pn, pn, pn], // Fila 7
      [n,  pn,  pn,  pn, pn, pn, pn, pn, n, n, n, n, pn, n, pn, pn, pn, pn, pn, pn], // Fila 8
      [n, pn,  pn,  pn,  pn,  n,  n,  pn,  n,  n,  n, n, pn, n, pn, n, n, n, pn, pn], // Fila 9
      [n, pn,  pn, n, n,  n, n, pn,  n,  n,  n,  n,  pn,  n, n,  n,  pn,  n, n, pn], // Fila 10
      [pn, pn,  n,  n, mn,  n, pn, pn,  n,  n, pn, pn, pn,  n, pn,  n, pn, pn,  n, pn], // Fila 11
      [n, pn, n, n, pn, pn, n,  n,  n,  n,  n,  n, n,  n,  n,  n, n, n,  n, pn], // Fila 12
      [n, pn,  n,  pn,  pn,  pn,  pn,  pn, pn, pn, pn,  pn, pn, pn, pn, pn, pn, pn,  pn, pn], // Fila 13
      [n, pn,  n, n, pn, pn, pn, n, n, n, n,  pn, n,  n, n, n, n, n,  n, n], // Fila 14
      [n, n, pn, n, n, pn, n, n, pn, pn, n, pn, n, n, n, n, n, n, n, n], // Fila 15
      [n, n, n, pn, n, n, n, pn, n, pn, n, pn, n, n, n, n, n, n, n, n], // Fila 16
      [n, n, n, n, pn, pn, pn, n, n, pn, n, pn, n, n, n, n, n, n, n, n], // Fila 17
      [n, n, n, n, n, n, n, n, n, pn, n, pn, n, n, n, n, n, n, n, n], // Fila 18
      [n, n, n, n, n, n, n, n, n, pn, n, pn, n, n, n, n, n, n, n, n]
     ]


    //Lista donde se guardan todas las paredes de la partida
    const paredes = []

    //Devuelve la matriz que delimita el mapa de la partida y sus paredes
    method matrizParedes() = matrizParedes

    method paredesPartida() = paredes

    //Imagen que tendrá la pared en toda la partida
    method imagenPared() = "../../assets/pared-tierra.png" 

    var manzanasActuales = 0

    //Metodo que se utiliza para iniciar el juego 1
    method iniciar(){

        //Aviso al objeto partida que comenzó la partida 1
        partida.nuevaPartida(self)

        //Defino el fondo background del mapa
		game.boardGround("../../assets/fondo-pasto.png") 

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

            partida.nuevaPartida(partida2)

            partida2.iniciar()
        }
    }
    
}

object cabeza {

    const cuerpos = []

    var posicionProximoCuerpo = position

    var property position = game.at(1,1)

    const imagen = "../../assets/cabeza-abajo.png"

    method imagenIzquierda ()= "img"

    method imagenDerecha ()= "img"

    method imagenArriba ()= "img"

    method imagenAbajo ()= "img"

    method image() = imagen

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
        var nuevoCuerpo = new Cuerpo(position = posicionProximoCuerpo)

        nuevoCuerpo.iniciar()

        cuerpos.add(nuevoCuerpo)

    }

    method interactuarCuerpo(){
        partida1.reiniciar()
    } 
}

//Cuerpo de la serpiente
class Cuerpo{

    var property position 
    const imagen = "../../assets/cuerpo.png"

    method image() = imagen

    method iniciar(){

        game.whenCollideDo(self, {personaje => personaje.interactuarCuerpo()})

        game.addVisual(self)
    }
}
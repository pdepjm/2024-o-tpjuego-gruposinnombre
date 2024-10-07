import wollok.game.*
import juego2.*
import general.*

object partida1{
   
    const objetivoManzanas = 5
    const manzanasEnMapa = []
    

    //Mapa completo de 10x8 delimitado por paredes sin paredes en el medio
    const matrizParedes = 
    [[p,p,p,p,p,p,p,p,p],
     [p,n,n,n,n,n,n,n,p]]

    method paredesPartida() = paredes

    var manzanasActuales = 0

    method iniciar(){
        game.height(20)
	    game.width(20)
	    game.cellSize(40)
        partida.nuevaPartida(self)
		game.boardGround("../../assets/fondo-pasto.png") 
        self.iniciarParedes()
        game.addVisual(cabeza)
        cabeza.position(game.center())
        //Cambiar la imagen de la manzana
    }

    method finalizarParedes(){ paredes.foreach({ pared => pared.iniciar() }) }

    method iniciarParedes(){ paredes.foreach({ pared => pared.iniciar() }) }

    method terminar(){
        game.removeVisual(cabeza)
        self.finalizarParedes()
        cabeza.destruirCuerpos()

        manzanasEnMapa.foreach({ manzana => 
            manzana.desaparecer()
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
       
        if(manzanasActuales == objetivoManzanas){
            //En este caso se debería pasar de nivel
            self.terminar()

            partida.nuevaPartida(partida2)

            partida2.iniciar()
        }
    }
    method personaje() = cabeza
}

object cabeza {

    const cuerpos = []
    var posicionProximoCuerpo = position
    var property position = game.center()
    var imagen = "../../assets/cabeza-abajo.png"

    method image() = imagen

    method destruirCuerpos(){
        cuerpos.forEach({cuerpo =>
            game.removeVisual(cuerpo)
            cuerpos.remove(cuerpo)
        })
    }

    method moverCuerpos(posicionAnteriorCabeza)
    {
        //Guardo la posicion donde se guardará el proximo cuerpo en caso de añadir uno
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
        })
    }

    method interactuarManzana(manzana){

        manzana.desaparecer()

        partida1.sumarManzana()

        self.crecer()
    }

    method interactuarPared(){
    }

    method crecer(){
        //Aca la imagen porque la declaran? no deberia formar parte de la clase
        var nuevoCuerpo = new Cuerpo(position = posicionProximoCuerpo, imagen = "imagen")

        nuevoCuerpo.iniciar()

        cuerpos.add(nuevoCuerpo)
    }

    method interactuarCuerpo(){
        partida1.reiniciar()
    } 
}

class Cuerpo{
    var property position 
    var imagen = "../../assets/cuerpo.png"

    method image() = imagen

    method iniciar(){
        game.whenCollideDo(self, {personaje => personaje.interactuarCuerpo()})
        game.addVisual(self)
    }
}
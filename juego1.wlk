import wollok.game.*
import juego2.*
import general.*

object cabeza inherits Personaje(posicionInicial = game.at(1,16)) {
    //Cuando come una manzana crece
    override method interactuarManzana(manzana) {
      super(manzana)
      self.crecer()
    }
    //override reiniciarPersonaje(){}
}

//partida1 hecha a partir de la clase Partida
const partida1 = new Partida(
    siguientePartida = partida2,  
    imagenPared = "pared-tierra.png", 
    personaje = cabeza,
    imagenManzana = "manzana.png",
    objetivoManzanas = 2, 
    matrizVisuales = [
        [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn],  // fila 0
        [pn,  n,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn, mn,  n, pn],  // fila 1
        [pn,  n, mn, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn,  n,  n, pn],  // fila 2
        [pn,  n,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn,  n, pn, pn],  // fila 3
        [pn,  n,  n, pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn,  n, pn, pn],  // fila 4
        [pn,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n,  n, pn,  n, mn, pn],  // fila 5
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
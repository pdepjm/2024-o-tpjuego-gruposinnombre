import wollok.game.*
import juego1.*
import screamer.*
import general.*

const santi = new Personaje(posicionInicial=game.at(1,1))

const partida2 = new Partida( 
  siguientePartida = partida3, 
  imagenPared = "pared-tierra.png",
  personaje = santi,
  imagenManzana = "manzana.png",
  objetivoManzanas = 1, 
  //ESTE MAPA YA ESTA BIEN HECHO
  matrizVisuales =[
    [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn],  // fila 17
    [pn, pn, mn,  n, pn, pn, pn, pn, pn, mn,  n,  n,  n,  n,  n, pn, mn, pn],  // fila 16
    [pn,  n,  n,  n,  n,  n,  n, pn, pn,  n,  n,  n, pn, pn,  n,  n,  n, pn],  // fila 15
    [pn,  n, pn, pn,  n, pn,  n, pn, pn, pn, pn,  n,  n, pn,  n, pn,  n, pn],  // fila 14
    [pn,  n, pn, pn, mn,  n,  n, pn, pn,  n,  n,  n,  n, pn, mn,  n,  n, pn],  // fila 13
    [pn,  n,  n,  n, pn, pn,  n, pn, pn,  n, mn, pn, pn, pn, pn, pn, pn, pn],  // fila 12
    [pn, pn, pn,  n, pn, pn,  n, pn, pn,  n,  n, pn,  n,  n,  n,  n, pn, pn],  // fila 11
    [pn,  n,  n,  n, pn, pn,  n,  n,  n,  n, pn, pn,  n, pn, pn,  n,  n, pn],  // fila 10
    [pn,  n, pn, pn, pn, pn, pn, pn,  n,  n,  n,  n,  n, pn, pn, mn,  n, pn],  // fila 9
    [pn,  n, pn, pn, pn, pn, pn,  n,  n,  n,  n,  n,  n, pn, pn, pn,  n, pn],  // fila 8
    [pn,  n, pn, pn, pn, pn, pn,  n, pn,  n, pn, pn,  n,  n,  n,  n,  n, pn],  // fila 7
    [pn,  n,  n,  n,  n,  n,  n,  n, pn,  n, pn, pn, pn,  n, pn,  n,  n, pn],  // fila 6
    [pn, pn, pn, pn, pn, pn, pn, pn, pn,  n,  n, mn, pn,  n, pn,  n,  n, pn],  // fila 5
    [pn, pn, pn, pn, pn, pn,  n,  n,  n,  n, pn,  n, pn,  n,  n,  n, pn, pn],  // fila 4
    [pn,  n,  n,  n,  n,  n,  n,  n, pn,  n, pn,  n, pn,  n, pn,  n, mn, pn],  // fila 3
    [pn,  n, mn, pn, pn,  n,  n,  n, pn,  n,  n,  n, pn,  n, pn,  n,  n, pn],  // fila 2
    [pn,  n,  n, pn, pn, pn,  n, mn, pn, pn, pn, pn, pn,  n,  n,  n,  n, pn],  // fila 1
    [pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn, pn]],
    manzanasActuales = 0
)
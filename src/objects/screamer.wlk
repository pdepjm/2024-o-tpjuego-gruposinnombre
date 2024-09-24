import wollok.game.*
import juego3.*
import general.*

object partida4
{
    method iniciar()
    {
    game.title("laberinto")
    game.height(50)
    game.width(50)
    game.cellSize(90)
    game.ground("negro.png")
    pared1.iniciar()
    personaje.iniciar()
    manzanaScreamer.iniciar()
    }
}

object pared1 {
  var property position = game.at(40, 20)
  method image()= "pared.png"
  method iniciar() {
  game.addVisual(self)
  }
  
} 
/*provisoriamente esta creado el objeto pared, se que son muchas y conviene una clase, pero me tiraba error 
al crearla e implementarla ya que el personaje tendria que hacer un  game.whenCollideDo con cada pared, o con la clase
de todas formas sigo averiguando como arreglarlo pero dejo el objeto pared1 para ver que la funcionalidad que si el personaje 
impacta resetee su posicion*/


object manzanaScreamer {
  var property position = game.at(48, 10)
  method image()= "manzana.png"
  method iniciar() {
    game.addVisual(self)
  }
} 
/*creo el objeto manzana ya que si bien para el juego uno tenemos una class, esta se comporta distinto, 
tiene como metodo spawnear el screamer*/

object personaje {
  var property position = game.at(48, 0)
  method image()= "mineSteve.gif" 

  method iniciar() 
  {
    game.addVisualCharacter(self)
    game.whenCollideDo(pared1, {personaje => personaje.resetPosition()})
    game.whenCollideDo(manzanaScreamer, {personaje => personaje.ponerScreamer()} )
  }

 method resetPosition() 
 {
  position = game.at(48, 0)
 }

 method ponerScreamer()
 {
  prueba.iniciar()
  self.resetPosition()
 }

}

object prueba {
  var property position = game.at(15, 15)
  method image() = "messi.png"

  method iniciar() 
  {
    game.addVisual(self)
  }

} 
/*prueba es la foto de messi, el personaje al impactar con la manzana lanza el prueba.iniciar, ahora le puse
que spawnee en unas coordenadas, pero el objetivo es que rellene toda la pantalla*/ 
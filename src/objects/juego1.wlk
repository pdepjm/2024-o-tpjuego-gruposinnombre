import wollok.game.*
import juego2.*
import general.*

object partida1
{
   
    const objetivoManzanas = 5
    
    var manzanasActuales = 0

    method iniciar()
    {
        
    }

    method sumarManzana()
    {
        
        manzanasActuales ++
       
        if(manzanasActuales == objetivoManzanas)
        {
           
            //En este caso se debería pasar de nivel
            partida2.iniciar()

        }
        
        else
        {

            return 0

        }
    }

}


object mapaJuego1
{
   
    const paredes = []

    method paredes() = paredes
}

const pared1 = new Pared(position = game.at(), imagen = )

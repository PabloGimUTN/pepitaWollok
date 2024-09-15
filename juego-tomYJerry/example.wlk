object tom{
  var property energia = 100

  method velocidad() = 5 + (self.energia() / 10)

  method comeRaton(raton){
    energia = self.cuantoDaEnergia(raton)
  }

  method corre(segundos){
    energia = (energia -  0.5 * (self.velocidad() * segundos)).max(0)
  }

  method meConvieneComerRatonA(unRaton,unaDistancia){
      const energiaQueDaRaton = self.cuantoDaEnergia(unRaton)
      const energiaQueGastaCorriendo = self.cuantaEnergiaGastaCorriendo(unaDistancia)    
      return energiaQueDaRaton > energiaQueGastaCorriendo
  }
  
  method cuantoDaEnergia(unRaton) = energia + 12 + unRaton.pesoGramos()

  method cuantaEnergiaGastaCorriendo (unaDistancia) = unaDistancia / self.velocidad()

}


// solo de ejmplo ya que el enunciado no pide crear a ningun raton

object jerry{

  method pesoGramos() = 20
}


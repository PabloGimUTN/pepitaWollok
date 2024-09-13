object pepita {
  var energy = 100
  var lugarDondeEsta = buenosAires

  method lugarDondeEsta()= lugarDondeEsta.kilometer()

  method andaALugar(lugarNuevo){
    var cantidadDeKilometros = elf.cantidadDeKilometrosEntreDosLugares(lugarNuevo,lugarDondeEsta)
    self.fly(cantidadDeKilometros)
    lugarDondeEsta = lugarNuevo
  }
  method puedeIr(lugar) {
      var cantidadDeKilometros = self.cantidadDeKilometrosEntreDosLugares(lugar,lugarDondeEsta)
      return  self.energiaRestante(cantidadDeKilometros) >= 0
  }

  method energy() = energy

  method fly(kilometer) {
    const energiaRestante = self.energiaRestante(kilometer)
    if(energiaRestante >= 0){
    energy = energiaRestante 
    }
  }

  method eat(gram){
    energy = energy + 4 * gram
  }

  method energiaRestante(kilometer) = energy - kilometer - 10
  
  method cantidadDeKilometrosEntreDosLugares(primerLugar,segundoLugar) = (primerLugar.kilometer() - segundoLugar.kilometer()).abs()
}



object buenosAires{
  const property kilometer = 0
}

object santaFe{
  const property kilometer = 14
}

object cordoba{
  const property kilometer = 40 
}

object tucuman{
  const property kilometer = 60
}

object brasil{
  const property kilometer = 200
}
object williWonka{

  var property empleados = #{}
  var property proyectos = #{}


  method agregarProyecto(proyecto){

    proyectos.add(proyecto)
    if(not(empleados.isEmpty())){
    proyecto.asignarEmpleado(empleados.anyOne())
    }

  }

  method contratarUmpaLumpa(empleado){
    //agregarlo a mis empleados
    empleados.add(empleado)
  }

  method pasarDia(){
      proyectos.forEach({proyecto => proyecto.trabajarAMisEmpleados()})
  }

  method proyectosInconclusos(){
    return proyectos.filter({proyecto => proyecto.inconcluso()})
  }

  method motivarEmpleados(){
    proyectos.forEach({proyecto => proyecto.motivarEmpleados()})
  }

  method cuantosFeatureTieneEmpleado(empleado){
    return empleado.features()
  }

  method empleadosSinProyectoAsignado(){
    return empleados.filter({empleado => not(proyectos.any({proyecto => proyecto.empleados().contains(empleado)}))})
  }
}


// PROYECTOS ---------------------------------------------
//crear cada proyecto como objeto
//estos proyectos saber si estan terminados o no 

object cardbury{

  var property features = 5
  var empleados = #{}

  method empleados() = empleados

  method asignarEmpleado(empleado) {
  empleados.add(empleado)
  } 

  method motivarEmpleados(){
    		empleados.forEach({empleado => empleado.motivar()})
  }
  method trabajarAMisEmpleados(){
      features = (features - empleados.sum({empleado => empleado.features()})).max(0)
  }

  method inconcluso(){
    return features != 0
  }
}

object vaporware{
  var property features = 20

  var empleados = #{}

  method asignarEmpleado(empleado) {
  empleados.add(empleado)
  } 
    
  method motivarEmpleados(){
    		empleados.forEach({empleado => empleado.motivar()})
  }

  method trabajarAMisEmpleados(){
    const featuresResueltos = empleados.sum({empleado => empleado.features()}).max(0)
    features = features - featuresResueltos
    features += featuresResueltos*2
  }

  method inconcluso(){
    return features != 0
  }
}

object verduleria{
  var property dias = 10
  var empleados = #{}

  method asignarEmpleado(empleado) {
    empleados.add(empleado)
  } 
    

  method motivarEmpleados(){
    		empleados.forEach({empleado => empleado.motivar()})
  }

  method trabajarAMisEmpleados(){
    dias = (dias - 1).max(0)
  }

  method inconcluso(){
    return dias != 0
  }

}

// EMPLEADOS ---------------

//crear a cada empleado
//para cada empleado tiene que tener una funcion motivar
//ver en que proyecto esta asignado dudoso

object juanCarlos{
  //poner en que proyecto esta

 method features() = 1

  method motivar(){

  }

  
}

object guillermoPuertas{

  var property calidadAnteojos = 1

  method features() = calidadAnteojos

  method motivar(){
    calidadAnteojos += 1
  }
}

object estebanTrabajos{
  var property features = 10

  method motivar(){
  features -= 1
  }
}

object ricardoHombrePuesto{

  var property features = 0

  method motivar(){

  }

}

object pepita{
  var property calorias = 500

  method features() = calorias / 500
  method motivar(){
    calorias += 1000
  }
}
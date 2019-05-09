object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos{
	var property cantidad = 0
	method peso() { return cantidad * 2 }
	method nivelPeligrosidad() { return 2 }
}

object arenaAGranel{
	var property peso = 1
	method nivelPeligrosidad(){ return 1 }
}

object bateriaAntiaerea{
	var property estaConLosMisiles = true
	
	method peso() { return if(estaConLosMisiles) { 300 } else { 200 } }
	method nivelPeligrosidad(){ return if(estaConLosMisiles) { 100 } else { 0 } }
}

object contenedorPortuario{
    const property cosas = []
    
	method pesoTotal() = cosas.sum({cosa => cosa.peso()}) + 100
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method descargar(cosa) {
		cosas.remove(cosa)
	}
	method nivelPeligrosidad(){ return if(cosas.isEmpty()) { 0 } else { cosas.max({cosa => cosa.nivelPeligrosidad()}) } }
}

object residuosRadioactivos{
	var property peso = 20
	
	method nivelPeligrosidad() { return 200 }
}

object embalajeDeSeguridad{
	method peso(cosa){ return cosa.peso() }
	method nivelPeligrosidad(cosa){ return cosa.nivelPeligrosidad() / 2 }
}

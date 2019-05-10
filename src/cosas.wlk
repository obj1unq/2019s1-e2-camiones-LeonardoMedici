object knightRider {
	var property bulto = 1
	
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	var property bulto = 2
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos{
	var cantidad = 0
	
	method cantidad(){ return cantidad }
	method sumarCantidad(int){ cantidad += int }
	method bulto(){ return if(cantidad < 101){ 1 } 
		else { if(cantidad.between(100, 300)){ 2 }else { 3 }}
	}
	method peso() { return cantidad * 2 }
	method nivelPeligrosidad() { return 2 }
}

object arenaAGranel{
	var peso = 0
	var property bulto = 1
	
	method peso() { return peso }
	method sumarPeso(int) { peso += int }
	method nivelPeligrosidad(){ return 1 }
}

object bateriaAntiaerea{
	var estaConLosMisiles = true
	
	method estaConLosMisiles(){ return estaConLosMisiles }
    method armar() { estaConLosMisiles = true }
    method desarmar() { estaConLosMisiles = false }
	method bulto(){ return if(estaConLosMisiles){ 2 } else { 1 }}
	method peso() { return if(estaConLosMisiles) { 300 } else { 200 } }
	method nivelPeligrosidad(){ return if(estaConLosMisiles) { 100 } else { 0 } }
}

object contenedorPortuario{
    const property cosas = []
    
    method reaccionarCosas(){ 	
    	if(cosas.contains(bumblebee)){ bumblebee.transformar() }
		if(cosas.contains(paqueteDeLadrillos)){ paqueteDeLadrillos.sumarCantidad(12) }
		if(cosas.contains(arenaAGranel)){ arenaAGranel.sumarPeso(20) }
		if(cosas.contains(residuosRadioactivos)){ residuosRadioactivos.sumarPeso(20) }
		if(cosas.contains(bateriaAntiaerea)){ bateriaAntiaerea.armar() } 
	}
    method bulto(){ return cosas.sum({cosa => cosa.bulto()}) + 1 }
	method peso() = cosas.sum({cosa => cosa.peso()}) + 100
	method cargar(unaCosa) {
		cosas.add(unaCosa)

	}
	method descargar(cosa) {
		cosas.remove(cosa)
	}
	method nivelPeligrosidad(){ return if(cosas.isEmpty()) { 0 } else { cosas.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad() } }
}

object residuosRadioactivos{
	var peso = 0
	var property bulto = 1
	
	method peso(){ return peso }
	method sumarPeso(int){ peso += int }
	method nivelPeligrosidad() { return 200 }
}

object embalajeDeSeguridad{
	var property recubre = knightRider
	var property bulto = 2
	
	method peso(){ return recubre.peso() }
	method nivelPeligrosidad(){ return recubre.nivelPeligrosidad() / 2 }
}

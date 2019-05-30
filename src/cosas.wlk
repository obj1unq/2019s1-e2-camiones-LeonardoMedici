object knightRider {
	var property bulto = 1
	
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method esCargada(){  }
}

object bumblebee {
	var transformadoEnAuto = true
	var property bulto = 2
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method esCargada(){ transformadoEnAuto = false }
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
	method esCargada(){ self.sumarCantidad(12) }
}

object arenaAGranel{
	var peso = 0
	var property bulto = 1
	
	method peso() { return peso }
	method sumarPeso(int) { peso += int }
	method nivelPeligrosidad(){ return 1 }
	method esCargada(){ self.sumarPeso(20) }
}

object bateriaAntiaerea{
	var estaConLosMisiles = true
	
	method estaConLosMisiles(){ return estaConLosMisiles }
    method armar() { estaConLosMisiles = true }
    method desarmar() { estaConLosMisiles = false }
	method bulto(){ return if(estaConLosMisiles){ 2 } else { 1 }}
	method peso() { return if(estaConLosMisiles) { 300 } else { 200 } }
	method nivelPeligrosidad(){ return if(estaConLosMisiles) { 100 } else { 0 } }
	method esCargada(){ self.armar() }
}

object contenedorPortuario{
    const property cosas = []
    
    method reaccionarCosas(){ 	
    	cosas.all{ cosa=> cosa.esCargada() } 
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
	method esCargada(){ self.reaccionarCosas() }
}

object residuosRadioactivos{
	var peso = 0
	var property bulto = 1
	
	method peso(){ return peso }
	method sumarPeso(int){ peso += int }
	method nivelPeligrosidad() { return 200 }
	method esCargada(){ self.sumarPeso(20) }
}

object embalajeDeSeguridad{
	var property recubre = knightRider
	var property bulto = 2
	
	method peso(){ return recubre.peso() }
	method nivelPeligrosidad(){ return recubre.nivelPeligrosidad() / 2 }
	method esCargada(){  }
}

import cosas.*

object camion {
	const property cosas = []
	
	method pesoTotal() = cosas.sum({cosa => cosa.peso()}) + 1000
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method descargar(cosa) {
		cosas.remove(cosa)
	}
	method excedidoDePeso(){ return self.pesoTotal() > 2500 }
	method objetosPeligrosos(nivel){
		return cosas.filter{ cosa => cosa.nivelPeligrosidad() > nivel}
	}
	method objetosMasPeligrososQue(cosa){
		return cosas.filter{ cosaL => cosaL.nivelPeligrosidad() > cosa.nivelPeligrosidad()}
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
	    return (cosas.filter({cosa => cosa.nivelPeligrosidad() > nivelMaximoPeligrosidad })).isEmpty()
	}
}

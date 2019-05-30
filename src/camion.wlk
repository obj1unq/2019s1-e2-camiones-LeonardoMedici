import cosas.*

object camion {
	const property cosas = []
	
	method pesoTotal() = cosas.sum({cosa => cosa.peso()}) + 1000
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.esCargada()
	}
	method descargar(cosa) {
		cosas.remove(cosa)
	}
	method excedidoDePeso(){ return self.pesoTotal() > 2500 }
	method objetosPeligrosos(nivel){
		return cosas.filter{ cosa => cosa.nivelPeligrosidad() > nivel}
	}
	method objetosMasPeligrososQue(cosa){
		return self.objetosPeligrosos(cosa.nivelPeligrosidad() )
	  }  
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
	    return cosas.all({cosa => cosa.nivelPeligrosidad() <= nivelMaximoPeligrosidad })
	}
	method tieneAlgoQuePesaEntre(min, max){
		return 	cosas.any{ cosa => cosa.peso().between(min, max)}
	}
	method cosaMasPesada(){
		return cosas.max({cosa => cosa.peso()})
	}
	method totalBultos(){
		return cosas.sum({cosa => cosa.bulto()})
	}
	method pesos(){
		return cosas.map({cosa => cosa.peso()})
	}
}

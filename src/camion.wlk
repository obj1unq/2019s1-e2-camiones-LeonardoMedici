import cosas.*

object camion {
	const property cosas = []
	
	method pesoTotal() = cosas.sum({cosa => cosa.peso()}) + 1000
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		if(unaCosa == bumblebee){ bumblebee.transformar() }
		if(unaCosa == paqueteDeLadrillos){ paqueteDeLadrillos.sumarCantidad(12) }
		if(unaCosa == arenaAGranel){ arenaAGranel.sumarPeso(20) }
		if(unaCosa == residuosRadioactivos){ residuosRadioactivos.sumarPeso(20) }
		if(unaCosa == bateriaAntiaerea){ bateriaAntiaerea.armar() }
		if(unaCosa == contenedorPortuario){ contenedorPortuario.reaccionarCosas() }
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
	method tieneAlgoQuePesaEntre(min, max){
		return 	not (cosas.filter{ cosa => cosa.peso().between(min, max)}).isEmpty()
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

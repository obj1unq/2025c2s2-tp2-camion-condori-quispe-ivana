import cosas.*

object camion {
	const property cosas = #{} //al usar property se crea automaticamente un getter (metodo para acceder al valor) y solo eso porque es un const

	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}
	method validarCarga(unaCosa) {
	  if (cosas.contains(unaCosa)){ 
			self.error("Ya esta en el camion")
		}
	}
/*
method cargar(unaCosa) {
		if (not cosas.contains(unaCosa)){ 
			cosas.add(unaCosa)
		}	
	}
hice esto con el not, tambien se me ocurrio hacer una validacion en vez de eso 
necesito hacerle sabar al usuario que no puede porque ya esta?

method descargar(unaCosa) {
	  if (cosas.contains(unaCosa)){
			cosas.remove(unaCosa)
		}
	}
*/
	method descargar(unaCosa) {
	  self.validarDescarga(unaCosa)
	  cosas.remove(unaCosa)
	}
	method validarDescarga(unaCosa) {
	  if (not cosas.contains(unaCosa)){
			self.error("No esta cargada en el camion")
	  }
	  
	}

	// todoPesoEsPar
	method todoPesoEsPar() {
		// var pesos = self.cosas().map({cosa => cosa.peso()}) 
		// pesos.all({peso => self.esPar(peso)})
	  return self.cosas().all({cosa => self.esPar(cosa.peso())})
	}
	method esPar(unPeso) {
	  return unPeso % 2 == 0
	}
//
	method hayAlgunaCosaQuePesa(peso) {
	  return self.cosas().any({cosa => cosa.peso() == peso})
	}
//
	method pesoTotalDelCamion() {
	  return 1000 + cosas.sum({cosa => cosa.peso()})
	}
	method excedioElpeso() {
	  return self.pesoTotalDelCamion() > 2500
	}
// 
	method elDeNivel(nivel) {
	  return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
	}
//
	method cosasMasPeligrosasQueSuperan(nivel) {
	  return self.cosas().filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}

	method cosasMasPeligrosasQue(cosa) {
	  return self.cosasMasPeligrosasQueSuperan(cosa.nivelPeligrosidad())
	}
	method puedeCircularEnRuta() {
	  
	}
}


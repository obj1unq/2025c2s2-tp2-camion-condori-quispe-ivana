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
	} //nativo %(otro) Respuestas resto de la división entre yo y el otro
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
	method puedeCircularEnRuta(nivelMaximo) {
	  return (not self.excedioElpeso()) && (cosas.count({cosa => cosa.nivelPeligrosidad() > nivelMaximo}) == 0)
	}
	method tieneAlgoQuePesaEntre_Y_(pesoUno, pesoDos) {
	  return cosas.any({cosa => cosa.peso() >= pesoUno && cosa.peso() <= pesoDos})
	}
	method cosaMasPesada() {
	  //var cosaMasPesada = cosas.map({cosa => cosa.nivelPeligrosidad()}).max()
	  return cosas.find({cosa => cosa.peso() > cosas.map({cosa => cosa.nivelPeligrosidad()}).max()})
	}
	method pesosDeLasCosas() {
	  return self.cosas().map({cosa => cosa.peso()}) //el map agarra un set y devuelve una lista
	}
//
	method cantTotalDeBultos() {
	return cosas.map({cosa => cosa.bultos()}).sum() 
	}

	method sufrirAccidente() {
		cosas.forEach({unaCosa => unaCosa.sufreAccidente()})
	  
	}// que pasa aca? accion? si => osea las cosas del camion se modifican 
	/*
	que hace el foreach ? se usa para recorrer una colección 
	y ejecutar una acción con cada elemento, sin devolver un resultado.

	set.forEach({ elemento => elemento.hacerAlgo() })
	lo uso cuando quiero hacer algo con cada elemento de una colección, 
	pero no deseo construir una nueva colección ni obtener un resultado.
	*/

	method transportar(destino, camino) {
	  if(camino.soportaViajes()){
		destino.agregarAlAlmacen(cosas)
		cosas.clear()
	  }
	}
}

object almacen {
	var property cosasDelAlmacen = #{}
    
	method agregarAlAlmacen(nuevasCosas) {
	  cosasDelAlmacen.addAll(nuevasCosas) // como es un set funciona como union

	}
}
object rutaNueve {
  method soportaViajes() {
	return camion.puedeCircularEnRuta(20)
  }
}
object caminosVecinales {
  var property pesoMaximoPermitido = 0 
  method soportaViajes() {
	return camion.pesoTotalDelCamion() <= pesoMaximoPermitido
  }
}


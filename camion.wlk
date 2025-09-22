import cosas.*

object camion {
	const property cosas = #{}
		
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
}


object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() {
	  return 1
	}
	method sufreAccidente() {
	  //println("No sufre efecto ")
	  //self.error("No sufre efecto ")
	}
}

object arenaAGranel {
	var property peso = 0
	/*method peso() {       
		return peso
	} //como es configurable necesitara un setter 
	method peso(_peso) {
	  peso = _peso
	}*/
	method nivelPeligrosidad() { return 1 }
	method bultos() {
	  return 1
	}
	method sufreAccidente() {
	  peso = peso + 20
	}
}
object bumblebee {
	var property transformacion = auto// Auto o Robot
    
	/*method transformacion(_tranformacion) {
	  transformacion = _tranformacion
	}*/

	method peso() { return 800 }
	method nivelPeligrosidad() { 
		return transformacion.nivelPeligrosidad()
	}
	method bultos() {
	  return 2
	}
	method sufreAccidente() {
	  if(transformacion == auto){
          self.transformacion(robot)
		}else{
		  self.transformacion(auto) // preguntar
		}
	}
	
}
object auto {
  const nivelPeligrosidad = 15 //por ahora solo necesito verlo -> getter
  method nivelPeligrosidad() {
	return nivelPeligrosidad
  }
}
object robot {
  const nivelPeligrosidad = 30 //solo necesito verlo -> getter
  method nivelPeligrosidad() {
	return nivelPeligrosidad
  }
}
object paqueteDeLadrillos {
   //var pesoUnLadrillo = 2 innecesario, porque el peso no varia, por eso solo puedo poner directamente 2 
   var cantDeLadrillos = 0 

   method peso(){
	return cantDeLadrillos * 2
   }
   method cantDeLadrillos(_CantDeLadrillos) {
	 cantDeLadrillos = _CantDeLadrillos
   }
   method cantDeLadrillos() = cantDeLadrillos

   method nivelPeligrosidad() { return 2 }
   method bultos() {
	  return if(cantDeLadrillos >= 101 && cantDeLadrillos <= 300) 2 
			 else if(cantDeLadrillos >= 301) 3
			 else 1
   }
   /*
   if(cantDeLadrillos <= 100) 1
	         else if(cantDeLadrillos >= 101 && cantDeLadrillos <= 300) 2 
			 else if(cantDeLadrillos >= 301) 3
			 else 0
   */
   method sufreAccidente() {
	  if(cantDeLadrillos <= 12){
          self.cantDeLadrillos(0)
		}else{
		  self.cantDeLadrillos(cantDeLadrillos - 12) // preguntar
		}
	}
}
 // porque no uso var peso? porque no necesito guardarla, el peso varia segun la cant de ladrillos => si lo guardo si o si me vere obligada a actualizarla simepre
// pero no combiene que cant de ladrillos sea parametro de peso tambien? asi es mas libre pero ¿necesito llamarla en otros lados? hay algun lugar que tambien llame cantDeLadrillos? mmm
 // return if (personaje.useDeEspada == 1) personaje.valorBase() else 0.50 * personaje.valorBase()

object bateriaAntiaerea {
   var equipo = misiles // misil es un objeto? si porque tiene un propio comportamiento, osea su atributo peso
   method equipo(_equipo) {
	 equipo = _equipo
   }
   method equipo() = equipo
   method peso() {
	 return equipo.peso()
   }
   method nivelPeligrosidad() { return equipo.nivelPeligrosidad() }
   method bultos() {
	  return equipo.bultos()
   }
   method sufreAccidente() {
	 equipo = sinMisiles
   }
   
}
object misiles {
  method peso(){ return 300 } 
  method nivelPeligrosidad() { return 100 }
  method bultos() { return 2 }
}

/*
como return if (equipo == misiles) 300 else 0 me tiraba erroramarillo
que deciaque deberia usar polimorfismo creo otro objeto que no se si es necesario
var equipo = misiles // misil es un objeto? si porque tiene un propio comportamiento, osea su atributo peso
   method peso() {
	 return if (equipo == misiles) 300 else 0
   }
*/
object sinMisiles {
  method peso() { return 200 }
  method nivelPeligrosidad() { return 0 }
  method bultos() { return 1 }
}
// preguntar-- si bien mi la solucion no me tira error y se resuelve no quita el hecho que recomiendo usar polimorfismo => hago sinMisiles
object residuosRadiactivos {
  var property peso = 0 
  method nivelPeligrosidad() { return 200 }
  method bultos() {
	  return 1
	}
	method sufreAccidente() {
	 peso = peso + 15
   }
}

object contenedorPortuario {
  const property cosasDelContenedor = #{}
  
  method cargarAlContenedor(unaCosa) {
	cosasDelContenedor.add(unaCosa)
  }
  method peso() {
	return 100 + cosasDelContenedor.sum({unaCosa => unaCosa.peso()})
  }
  method nivelPeligrosidad(){
	return if(cosasDelContenedor.size() == 0) 0 else cosasDelContenedor.map({cosa => cosa.nivelPeligrosidad()}).max()
  }
  method bultos() { return 1 + cosasDelContenedor.map({cosa => cosa.bultos()}).sum() }
  
  method sufreAccidente() {
	 cosasDelContenedor.forEach({unaCosa => unaCosa.sufreAccidente()})
   }
}

object embalajeDeSeguridad {
  var contenido = null //inicializo con bumbalbe , creo que tambien puede ser null

  method embalar(unaCosa) {
	contenido = unaCosa
  }
/*  method desenvolver() {
	
  }*/
  method peso() {
	return contenido.peso()
  }
  method nivelPeligrosidad() {
	return contenido.nivelPeligrosidad() / 2
  }
  method bultos() {
	  return 2
  }
  method sufreAccidente() {
	  //self.error("No sufre efecto ")
	  //println("No sufre efecto ")
  }
  // funciono - debo preguntar a la profe si es correcto usarlo asi o debo usar eso de odd (saber si es impar ) y con ello devolver la mitad exacta del peso usando flooar
  // esto es de return contenido.nivelPeligrosidad().div(2) division entera.
}
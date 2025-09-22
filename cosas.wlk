object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaAGranel {
	var property peso = 0
/*	method peso() {       
		return peso
	} como es configurable necesitara un setter 
*/
	method nivelPeligrosidad() { return 1 }

}
object bumblebee {
	var transformacion = auto// Auto o Robot
    
	method transformacion(_tranformacion) {
	  transformacion = _tranformacion
	}

	method peso() { return 800 }
	method nivelPeligrosidad() { 
		return transformacion.nivelPeligrosidad()
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
   method nivelPeligrosidad() { return 2 }
}
 // porque no uso var peso? porque no necesito guardarla, el peso varia segun la cant de ladrillos => si lo guardo si o si me vere obligada a actualizarla simepre
// pero no combiene que cant de ladrillos sea parametro de peso tambien? asi es mas libre pero ¿necesito llamarla en otros lados? hay algun lugar que tambien llame cantDeLadrillos? mmm
 // return if (personaje.useDeEspada == 1) personaje.valorBase() else 0.50 * personaje.valorBase()

object bateriaAntiaerea {
   var equipo = misiles // misil es un objeto? si porque tiene un propio comportamiento, osea su atributo peso
   method equipo(_equipo) {
	 equipo = _equipo
   }
   method peso() {
	 return equipo.peso()
   }
   method nivelPeligrosidad() { equipo.nivelPeligrosidad() }
}
object misiles {
  method peso(){ return 300 } 
  method nivelPeligrosidad() { return 100 }
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
}
// preguntar-- si bien mi la solucion no me tira error y se resuelve no quita el hecho que recomiendo usar polimorfismo => hago sinMisiles
object residuosRadiactivos {
  var property peso = 0 
  method nivelPeligrosidad() { return 200 }
}


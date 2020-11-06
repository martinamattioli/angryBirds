import pajaros.*
import islaCerdito.*

class NoHayPajarosHomenajeadosException inherits Exception{}

object islaPajaro{
	const pajaros = #{chuck,matilda,pajaroComun,red,terence}
	const eventos = [sesionDeManejoDeIra,invasionDeCerdos,fiestaSorpresa]
	
	method pajarosMasFuertes() = pajaros.filter({pajaro => pajaro.esFuerte()})
	
	method fuerza() = pajaros.sum({pajaro => pajaro.fuerza()})
	
	method serieDeEventosDesafortunados(cantidadDeVeces){
		cantidadDeVeces.times(self.ocurreCadaEvento())
	}
	
	method ocurreCadaEvento() = eventos.forEach({evento => evento.afectarPajaros(pajaros)})
	
	method ocurreUnEvento(unEvento){
		unEvento.afectarPajaros(pajaros)
	}
	
	method atacar(){
		pajaros.all({pajaro => pajaro.derribar(islaCerdito.obstaculoCercano())})
	}
	
	method seRecuperaronLosHuevos(){
		self.atacar()
		return islaCerdito.quedoLibreDeObstaculos()
	}
}

//////////////// INTERFAZ EVENTO //////////////////////

object sesionDeManejoDeIra{
	method afectarPajaros(unosPajaros){
		unosPajaros.forEach({pajaro => pajaro.tranquilizarse()})
	}
}

object invasionDeCerdos{
	const cerditosInvasores = 100
	
	// enoja a todos los pajaros UNA VEZ POR CADA 100 invasores
	
	// incompleto
	
	method afectarPajaros(unosPajaros){
		
	}
}


object fiestaSorpresa{
	
	method pajarosHomenajeados(unosPajaros) = unosPajaros.filter({pajaro => pajaro.esHomenajeado()})
	
	method validarExistenciaPajarosHomenajeados(unosPajaros){
		if(self.pajarosHomenajeados(unosPajaros).isEmpty()){
			 throw new NoHayPajarosHomenajeadosException()
		}
	}
	method afectarPajaros(unosPajaros){
		self.validarExistenciaPajarosHomenajeados(unosPajaros)
		(self.pajarosHomenajeados(unosPajaros)).forEach({pajaro => pajaro.enojarse()})
	}
}

// Supongo que "serie de eventos desafortunados" es simplemente usarlos en la Clase //
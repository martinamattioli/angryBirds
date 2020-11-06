import islaCerdito.*

class ExcedioSuLimiteDeFuerzaException inherits Exception{}
class NuncaPuedeTranquilizarseException inherits Exception{}

class Pajaro{
	var enojos
	var ira
	
	method fuerza() = self.multiplicarIraPor(2)
	
	method multiplicarIraPor(unValor) = ira*unValor
	
	method enojarse(){}
	
	method cantidadDeVecesEnojado() = enojos.size()
	
	method validarTopeDeFuerza(unTope){
		if(self.fuerza() > unTope) throw new ExcedioSuLimiteDeFuerzaException()
	}
	
	method esFuerte() = self.fuerza() > 50
	
	method tranquilizarse(){
		ira -= 5
	}
	
	method esHomenajeado() = false
	
	method puedeDerribar(obstaculo) = self.fuerza() > obstaculo.resistencia()
	
	method derribar(obstaculo){
		if(self.puedeDerribar(obstaculo))
		islaCerdito.obstaculoDerribado(obstaculo)
	}

}

object pajaroComun inherits Pajaro{ }


class PajaroRencoroso inherits Pajaro{
	var multiplicador
	override method fuerza() = self.multiplicarIraPor(multiplicador*self.cantidadDeVecesEnojado())
}

object red inherits PajaroRencoroso(multiplicador = 10){ }

object terence inherits PajaroRencoroso{ }

object bomb inherits Pajaro{
	override method fuerza(){
		self.validarTopeDeFuerza(9000)
		return super()
	}
}

object chuck inherits Pajaro{
	var velocidadCorriendo = 0
	
	method velocidadDeMas() = velocidadCorriendo - 80

	override method fuerza(){
		if(velocidadCorriendo <= 80){
			return 150
		}else return 150 + (self.velocidadDeMas()*5)
	}	
	
	override method enojarse(){
		velocidadCorriendo = velocidadCorriendo*2
	}	
	
	override method tranquilizarse(){
		throw new NuncaPuedeTranquilizarseException()
	}
}

object matilda inherits Pajaro{
	var fuerzasDeSusHuevos = [] // o hay que hacer una clase huevos que tengan atributo fuerza???
	
	override method fuerza() = super() + self.sumaDeFuerzasHuevales()
	
	method sumaDeFuerzasHuevales() = fuerzasDeSusHuevos.sum()
	
	override method enojarse(){
		fuerzasDeSusHuevos.add(2)
	}
	
}
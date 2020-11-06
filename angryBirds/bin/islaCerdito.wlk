object islaCerdito{
	const property obstaculos = [deVidrio,deMadera,dePiedra,cerditoObrero,cerditoConCasco,cerditoConEscudo]
	
	method obstaculoCercano() = obstaculos.anyOne()

	method obstaculoDerribado(unObstaculo){
		obstaculos.remove(unObstaculo)
	}
	
	method quedoLibreDeObstaculos() = obstaculos.isEmpty()
}

///////////// INTERFAZ OBSTACULO ////////////////////

class Pared{
	const anchoDeLaPared
	const multiplicador
	
	method resistencia() = multiplicador*anchoDeLaPared
	

}

object deVidrio inherits Pared(multiplicador = 10){ }

object deMadera inherits Pared(multiplicador = 25){ }

object dePiedra inherits Pared(multiplicador = 50){ }

object cerditoObrero{
	method resistencia() = 50
	
}

class CerditoArmado{
	const resistenciaDelArma
	method resistencia() = 10*resistenciaDelArma
	
}

object cerditoConCasco{ }
object cerditoConEscudo{ }

// Seran instancias de una clase en vez de WKOs ???? 
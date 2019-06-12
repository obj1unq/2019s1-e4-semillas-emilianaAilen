class Planta{
	var property anioDeObtencion
	var property altura
}

class Menta inherits Planta{
	
	method horasDeSolQueTolera() = 6
	method daSemillas(){
		return self.esFuerte() or altura > 0.4
	}
	method esFuerte(){
		return self.horasDeSolQueTolera() > 10
	}
	method espacioQueOcupa(){
		return altura*3
	}
	method parcelaResultaIdeal(unaParcela){
		return unaParcela.superficie() > 6
	}
	
}

class Soja inherits Planta{
	method horasDeSolQueTolera(){
		if(altura < 0.5){
			return 6
		}
		else if(altura >0.5 and altura < 1){
			return 7
		}
		else{return 9}
	}
	method daSemillas(){
		return (anioDeObtencion > 2007 and altura > 1) or self.esFuerte()
	}
	method esFuerte(){
		return self.horasDeSolQueTolera() > 10
	}
	method espacioQueOcupa(){
		return altura / 2
	}
	method parcelaResultaIdeal(unaParcela){
		return self.horasDeSolQueTolera() == unaParcela.horasDeSolQueRecibe()
	}
}

class Quinoa inherits Planta{
	var property horasDeSolQueTolera
	method espacioQueOcupa() = 0.5
	method daSemillas(){
		return anioDeObtencion < 2005 or self.esFuerte()
	}
	method esFuerte(){
		return self.horasDeSolQueTolera() > 10
	}
	
	method parcelaResultaIdeal(unaParcela){
		return unaParcela.plantas().all({unaPlanta => unaPlanta.altura()<= 1.5})
	}
	
	
}

//variedades

class SojaTransgenica inherits Soja{
	override method daSemillas(){
		return false
	}
	override method parcelaResultaIdeal(unaParcela){
		return unaParcela.cantMaximaDePlantasQueTolera() ==1
	}
}

class Hierbabuena inherits Menta{
	override method espacioQueOcupa(){
		return (altura*3)*2
	}
}

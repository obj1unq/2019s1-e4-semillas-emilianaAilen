class Parcela {
	var property ancho
	var property largo
	var property plantas= []
	var property horasDeSolQueRecibe
	var property tipo //recibe objeto, tipo de parcela
	
	method superficie()= ancho * largo
	method cantMaximaDePlantasQueTolera(){
		if(ancho > largo){
			return (self.superficie() / 5).roundUp()
		}
		else{
			return ((self.superficie() / 3) + largo).roundUp()
		}
	}
	method tieneComplicaciones(){
		return plantas.any({unaPlanta=> unaPlanta.horasDeSolQueTolera() < self.horasDeSolQueRecibe()})
	}
	method plantar(planta){
		if(self.cantDePlantas() < self.cantMaximaDePlantasQueTolera() and 
			 (planta.horasDeSolQueTolera() >= horasDeSolQueRecibe
			 	or planta.horasDeSolQueTolera() == horasDeSolQueRecibe - 1)){
			plantas.add(planta)
		}
		else{
			 throw new Exception("no se puede plantar")
		}
	}
	
	method cantDePlantas(){
		return plantas.size()
	}
	method esAutoSustentable(){
		return self.cantDePlantas() > 4
	}
	method plantaSeAsociaBien(unaPlanta){
		return tipo.seAsociaBienA_(self, unaPlanta)
	}
	
	method porcentajeDePlantasBienAsociadas(){
		return (self.cantPlantasBienAsociadas()* 100) / self.cantDePlantas()
	}
	method cantPlantasBienAsociadas(){
		return plantas.count({planta => self.plantaSeAsociaBien(planta)})
	}
}


//tipos de parcela

object ecologica{
	method seAsociaBienA_(parcela, planta){
		return not parcela.tieneComplicaciones() and planta.parcelaResultaIdeal(parcela)
	}
}
object industrial{
	method seAsociaBienA_(parcela, planta){
		return parcela.cantDePlantas() <= 2 and planta.esFuerte()
	}
}
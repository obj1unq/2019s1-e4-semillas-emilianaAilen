object inta{
	var property parcelas =[]
	method agregarParcela(parcela){
		parcelas.add(parcela)
	}
	method promedioDePlantas(){
		return self.cantidadDePlantasTotal() / self.cantDeParcelas()
	}
	method cantidadDePlantasTotal(){
		return parcelas.sum({parcela => parcela.cantDePlantas()})
	}
	method cantDeParcelas() = parcelas.size()
	
	method parcelaMasAutosustentable(){
		return self.candidatasAMasAutosustentables().find({parcela => 
			parcela.porcentajeDePlantasBienAsociadas() == self.maxPorcentajeDePlantasBienAsociadas() })
	}
	method candidatasAMasAutosustentables(){
		return parcelas.filter({parcela=> parcela.esAutoSustentable()})
	}
	method maxPorcentajeDePlantasBienAsociadas(){
		return self.porcentajesDePlantasBienAsociadasXParcela().max()
	}
	method porcentajesDePlantasBienAsociadasXParcela(){
		return self.candidatasAMasAutosustentables().map({unaParcela => unaParcela.porcentajeDePlantasBienAsociadas()})
	}
}

object camion {
    var carga = []

    method cargarCosa(unaCosa){
        carga.add(unaCosa)
    }

    method descargarCosa(unaCosa){
        carga.remove(unaCosa)
    }

    method pesoTotal(){
        return carga.sum({c => c.peso()}) + 1000
    }

    method pesoImpar(){
        return carga.all({c => c.peso().odd()})
    }

    method cosaQuePesa(unPeso){
        return carga.any({c => c.peso() == unPeso})
    }

    method cosaDePeligrosidad(nivelDePeligrosidad){
        return carga.find({c => c.peligrosidad() == nivelDePeligrosidad})
    }

    method cosasQueSuperan(nivelDePeligrosidad){
        return carga.filter({c => c.peligrosidad() > nivelDePeligrosidad})
    }

    method cosasQueSuperanA(unaCosa){
        return self.cosasQueSuperan(unaCosa.peligrosidad())
    }

    method estaExcedido(){
        return self.pesoTotal() > 2500
    }

    method puedeViajar(nivelDePeligrosidad){
        return not self.estaExcedido() and self.noHayCosasQueSuperen(nivelDePeligrosidad)
    }

    method noHayCosasQueSuperen(nivelDePeligrosidad){
        return carga.all({c => c.peligrosidad() < nivelDePeligrosidad})
    }
}
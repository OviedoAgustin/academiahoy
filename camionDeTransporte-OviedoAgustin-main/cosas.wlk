object knightRider {
  method peso() = 500
  method peligrosidad() = 10
}

object bumblebee {
    var estado = auto

    method transformar(unEstado){
        estado = unEstado
    }

    method peso() = 800

    method peligrosidad() = estado.peligrosidad()
}

object auto {
  method peligrosidad() = 15
}

object robot {
  method peligrosidad() = 30
}

object paqueteDeLadrillos {
    var property cantidadDeLadrillos = 0 
    method peso() = 2 * cantidadDeLadrillos
    method peligrosidad() = 2
}

object arenaAGranel {
    var property peso = 0
    method peligrosidad() = 1
}

object bateriaAntiAerea {
    var property estaConMisiles = false
    method peso() = if(estaConMisiles) 300 else 200
    method peligrosidad() = if(estaConMisiles) 100 else 0 
}


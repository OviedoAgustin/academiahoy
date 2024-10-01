import magos.*

object academina {
  const property candidatos = [] // definimos ambas de esta forma porque podemos acceder a sus atributos desde afuera
  const property equipo = []
  
  method evaluar(unMago){
    return unMago.energia() > 40 and unMago.poder() >= 30
  }

  method unirse(unMago){
    if (self.evaluar(unMago)){
        equipo.add(unMago)
    } else {
        candidatos.add(unMago)
    }
  }

  method entrenar(){
    equipo.forEach({m => m.entrenar()})
  }

  method volverAEvaluar(){
    const pasaron = candidatos.filter({c => self.evaluar(c)})
    equipo.addAll(pasaron)
    candidatos.removeAll(pasaron)
  }

  method poderTotal(){
    return equipo.sum({m => m.poder()})
  }

  method estanEnCondiciones(){
    return equipo.all({m => m.energia() > 45})
  }

  method deltaDeEnergia(){ // revisar en la clase como razonar el delta de la energia. Ya fue revisado y corregido
    const maximoPoder = equipo.max({m => m.poder()})
    const minimoPoder = equipo.min({m => m.poder()})
    return (maximoPoder.energia() - minimoPoder.energia()).abs() // valor absoluto. convierte negativos a positivos
    //return equipo.max({m => m.energia()}).energia() - equipo.min(({m => m.energia()})).energia()
  }

  method nombresCon90DeEnergia(){
    const magosMas90 = equipo.filter({m => m.energia() > 90})
    return magosMas90.map({mag => mag.nombre()})
  }
}
object camion {
    const cosas = []
    method peso() = self.pesoCosas() + 1000

    method cargarCosa(cosa) {
        cosa.reaccionAlCargar()
        cosas.add(cosa)
    }

    method descargarCosa(cosa) {
        cosas.remove(cosa)
    }

    method pesoCosas() {
        return cosas.sum({cosa => cosa.peso()})
    }

    method pesosImpares() {
        return cosas.all({cosa => cosa.peso().even()})
    }

    method cosaDeValor(valor) {
        return cosas.any({cosa => cosa.peso() == valor})
    }

    method primerPeligro(nivel) {
        return cosas.find({cosa => cosa.nivel() == nivel})
    }

    method peligrosasDeNivel(nivel) {
        return cosas.filter({cosa => cosa.nivel() > nivel})
    }

    method peligrosidad(cosaDada) {
        return cosas.filter({cosa => cosa.nivel() > cosaDada.nivel()})
    }

    method excedidoDePeso() = self.peso() > 2500
    method puedeCircularEnRuta(nivelPeligrosidad) {
        return !self.excedidoDePeso() and cosas.all({cosa => cosa.nivel() < nivelPeligrosidad})
    }

    method cosaEntre(valorMin, valorMax) {
        return cosas.anyOne({cosa => cosa.peso().between(valorMin, valorMax)})
    }

    method cosaMasPesada() = cosas.max({cosa => cosa.peso()})
}
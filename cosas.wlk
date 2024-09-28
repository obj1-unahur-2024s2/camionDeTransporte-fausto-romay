object knightRider {
    method peso() = 500
    method nivel() = 10
    method bultosOcupados() = 1

    method reaccionAlCargar() {
        //No hace nada
    }
}

object bumblebee {
    var transformadoEnAuto = false
    method peso() = 800
    
    method transformarse() {
        if (!transformadoEnAuto) {
            transformadoEnAuto = true
        } else {
            transformadoEnAuto = false
        }
    }

    method nivel() {
        if (!transformadoEnAuto) {
            return 30
        } else {
            return 15
        }
    }

    method bultosOcupados() = 2

    method reaccionAlCargar() {
        transformadoEnAuto = false
    }
}

object paqueteLadrillos {
    var cant = 10
    method peso() = 2 * cant
    method nivel() = 2

    method agregarLadrillos(cantidad) {
        cant = cant + cantidad
    }

    method quitarLadrillos(cantidad) {
        cant = 0.max(cant - cantidad)
    }

    method bultosOcupados() {
        if (cant <= 100) {
            return 1
        } else if (cant.between(101, 300)) {
            return 2
        } else {
            return 3
        }
    }

    method reaccionAlCargar() {
        cant = cant + 12
    }
}

object arena {
    var property peso = 5
    method nivel() = 1
    method bultosOcupados() = 1

    method reaccionAlCargar() {
        peso = 0.max(peso - 10)
    }
}

object bateriaAntiaerea {
    var contieneMisiles = false
    
    method colocarMisiles() {
        contieneMisiles = true
    }

    method quitarMisiles() {
        contieneMisiles = false
    }

    method peso() {
        if (!contieneMisiles) {
            return 200
        } else {
            return 300
        }
    }

    method nivel() {
        if (!contieneMisiles) {
            return 0
        } else {
            return 100
        }
    }

    method bultosOcupados() {
        if (contieneMisiles) {
            return 2
        } else {
            return 1
        }
    }

    method reaccionAlCargar() {
        contieneMisiles = true
    }
}

object contenedorPortuario {
    const cosas = []
    method agregarCosas(cosa) {
        cosas.add(cosa)
    }

    method peso() {
        return 100 + cosas.count()
    }

    method nivel() {
        return cosas.max({cosa => cosa.nivel()}).max(0)
    }

    method bultosOcupados() = 1 + cosas.sum({cosa => cosa.bultosOcupados()})

    method reaccionAlCargar() {
        cosas.map({cosa => cosa.reaccionAlCargar()})
    }
}

object residuoRadioactivo {
    var property peso = 80
    method nivel() = 200
    method bultosOcupados() = 1

    method reaccionAlCargar() {
        peso = peso + 15
    }
}

object embalajeSeguridad {
    var objetoEmbalado = null

    method objeto() = objetoEmbalado
    method cambiarObjeto(nObjeto) {
        objetoEmbalado = nObjeto
    }

    method peso() = objetoEmbalado.peso()
    method nivel() = objetoEmbalado.nivel() / 2
    method bultosOcupados() = 2

    method reaccionAlCargar() {
        //No afecta en nada.
    }
}
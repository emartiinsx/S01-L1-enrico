
class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(`${this.nome} atacou ${alvo.nome} usando aura!`);
    }
}

class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} atacou ${alvo.nome} com um soco de aura!`);
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} atacou ${alvo.nome} com aura elétrica!`);
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} atacou ${alvo.nome} com uma corrente de aura!`);
    }
}

class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}

class TrupeFantasma {
    #aranhas;

    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    revelarAranhas() {
        console.log(`Trupe Fantasma em ${this.cidade}:`);
        this.#aranhas.forEach(a => console.log(`Número ${a.numero}: ${a.nome}`));
    }

    buscarAranha(numero) {
        return this.#aranhas.find(a => a.numero === numero);
    }
}

const chrollo = new Aranha('Chrollo', 0);
const feitan = new Aranha('Feitan', 2);

const trupe = new TrupeFantasma('Yorknew', [chrollo, feitan]);
trupe.revelarAranhas();

const alvo = trupe.buscarAranha(2);

const hunters = [
    new Intensificador('Gon'),
    new Transmutador('Killua'),
    new Materializador('Kurapika')
];

hunters.forEach(h => h.atacar(alvo));

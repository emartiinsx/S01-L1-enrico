
class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

class AgenteProtocolo {
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;
        this.#pistola = new Pistola(modeloDaPistola);
    }

    usarHabilidade() {
        throw new Error(`${this.codinome} precisa de uma habilidade!`);
    }

    entrarEmCombate() {
        console.log(`${this.codinome} entrou em combate com a ${this.#pistola.modelo}. ${this.usarHabilidade()}`);
    }
}

class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return `${this.codinome} usou uma cortina de fumaça!`;
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return `${this.codinome} usou um flash!`;
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return `${this.codinome} avançou com sua habilidade!`;
    }
}

class Esquadrao {
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`Esquadrão ${this.nome} iniciou a partida!`);
        this.#agentes.forEach(a => a.entrarEmCombate());
    }

    listarControladores() {
        return this.#agentes.filter(a => a instanceof Controlador);
    }
}

const omen = new Controlador('Omen', 'Ghost');
const brimstone = new Controlador('Brimstone', 'Classic');
const sova = new Iniciador('Sova', 'Sheriff');
const jett = new Duelista('Jett', 'Frenzy');

const esquadrao = new Esquadrao('Alpha', [omen, brimstone, sova, jett]);
esquadrao.iniciarPartida();

console.log('Controladores:');
esquadrao.listarControladores().forEach(a => console.log(a.codinome));

const agente = new AgenteProtocolo('Agente', 'Classic');
// agente.entrarEmCombate();


class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `${this.criatura} - Nível de perigo: ${this.nivelDePerigo}`;
    }
}

class DiarioMisterioso {
    #fichas;

    constructor(numero) {
        this.numero = numero;
        this.#fichas = [];
    }

    anotar(criatura, nivelDePerigo) {
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(ficha);
    }

    exibirFichas() {
        console.log(`Diário número ${this.numero}:`);
        this.#fichas.forEach(f => console.log(f.descrever()));
    }
}

class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio {
    #funcionarios;

    constructor(dono) {
        this.dono = dono;
        this.#funcionarios = [];
    }

    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`A Cabana do Mistério de ${this.dono} abriu!`);
        this.#funcionarios.forEach(f => console.log(`${f.nome} - ${f.cargo}`));
    }
}

const diario = new DiarioMisterioso(3);
diario.anotar('Gnomos', 'Baixo');
diario.anotar('Bill Cipher', 'Muito alto');
diario.anotar('Monstro do Lago', 'Médio');
diario.exibirFichas();

const dipper = new Funcionario('Dipper', 'Atendente');
const mabel = new Funcionario('Mabel', 'Vendedora');

const cabana = new CabanaDoMisterio('Stan');
cabana.contratar(dipper);
cabana.contratar(mabel);
cabana.abrirAsPortas();

// Composição: o diário cria as fichas dentro do método anotar().
// Agregação: os funcionários são criados antes e depois contratados pela cabana.

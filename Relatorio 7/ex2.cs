using System;
using System.Collections.Generic;

public class Pokemon
{
    public string Especie { get; private set; }
    public int Nivel { get; private set; }

    public Pokemon(string especie, int nivel)
    {
        this.Especie = especie;
        this.Nivel = nivel;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"{Especie} usou um ataque comum.");
    }
}

public class TipoPlanta : Pokemon
{
    public TipoPlanta(string especie, int nivel) : base(especie, nivel)
    {
    }

    public override void Atacar()
    {
        Console.WriteLine($"{Especie} usou Folha Navalha.");
    }
}

public class TipoEletrico : Pokemon
{
    public TipoEletrico(string especie, int nivel) : base(especie, nivel)
    {
    }

    public override void Atacar()
    {
        base.Atacar();
        Console.WriteLine($"{Especie} soltou uma descarga eletrica.");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        List<Pokemon> pokemons = new List<Pokemon>();

        pokemons.Add(new TipoPlanta("Bulbasaur", 10));
        pokemons.Add(new TipoEletrico("Pikachu", 12));
        pokemons.Add(new Pokemon("Eevee", 8));

        foreach (var pokemon in pokemons)
        {
            pokemon.Atacar();
        }
    }
}
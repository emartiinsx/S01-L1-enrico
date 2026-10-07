using System;
using System.Collections.Generic;

public class Grimorio
{
    public string FeiticoFavorito { get; set; } = "Nenhum";

    public void Abrir()
    {
        Console.WriteLine($"Feitico favorito: {FeiticoFavorito}");
    }
}

public class Companheiro
{
    public string Nome { get; set; }
    public string Funcao { get; set; }

    public Companheiro(string nome, string funcao)
    {
        this.Nome = nome;
        this.Funcao = funcao;
    }

    public void Apresentar()
    {
        Console.WriteLine($"{Nome} - {Funcao}");
    }
}

public class Maga
{
    public string Nome { get; set; }
    public Grimorio Grimorio { get; private set; }

    private List<Companheiro> _companheiros;

    public Maga(string nome)
    {
        this.Nome = nome;

        this.Grimorio = new Grimorio();

        this._companheiros = new List<Companheiro>();
    }

    public void Recrutar(Companheiro c)
    {
        this._companheiros.Add(c);
    }

    public void MostrarGrupo()
    {
        Console.WriteLine($"Grupo de {Nome}:");

        foreach (var companheiro in _companheiros)
        {
            companheiro.Apresentar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Companheiro fern = new Companheiro("Fern", "Maga");
        Companheiro stark = new Companheiro("Stark", "Guerreiro");

        Maga frieren = new Maga("Frieren");

        frieren.Recrutar(fern);
        frieren.Recrutar(stark);

        frieren.Grimorio.FeiticoFavorito = "Zoltraak";

        frieren.MostrarGrupo();
        frieren.Grimorio.Abrir();
    }
}
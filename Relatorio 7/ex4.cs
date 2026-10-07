using System;
using System.Collections.Generic;

public class EntidadeCosmica
{
    public string Nome { get; set; }
    public string Origem { get; set; } = "Desconhecida";

    public EntidadeCosmica(string nome)
    {
        this.Nome = nome;
    }

    public virtual void Manifestar()
    {
        Console.WriteLine($"Entidade: {Nome}");

        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem: {Origem}");
        }
    }
}

public class Profundo : EntidadeCosmica
{
    public Profundo(string nome) : base(nome)
    {
    }

    public override void Manifestar()
    {
        Console.WriteLine($"O Profundo {Nome} surgiu do oceano.");
    }
}

public class MiGo : EntidadeCosmica
{
    public MiGo(string nome) : base(nome)
    {
    }

    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine("A criatura Mi-Go apareceu.");
    }
}

public class Pesquisador
{
    public string Nome { get; set; }

    private List<EntidadeCosmica> _catalogo;

    public Pesquisador(string nome)
    {
        this.Nome = nome;
        this._catalogo = new List<EntidadeCosmica>();
    }

    public void Catalogar(EntidadeCosmica e)
    {
        this._catalogo.Add(e);
    }

    public void LerCatalogo()
    {
        Console.WriteLine($"Catalogo de {Nome}:");

        foreach (var entidade in _catalogo)
        {
            entidade.Manifestar();
            Console.WriteLine();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Profundo profundo = new Profundo("Dagon");

        MiGo migo = new MiGo("Mi-Go");
        migo.Origem = "Yuggoth";

        EntidadeCosmica entidade =
            new EntidadeCosmica("A Cor que Caiu do Espaco");

        Pesquisador pesquisador = new Pesquisador("Henry");

        pesquisador.Catalogar(profundo);
        pesquisador.Catalogar(migo);
        pesquisador.Catalogar(entidade);

        pesquisador.LerCatalogo();
    }
}
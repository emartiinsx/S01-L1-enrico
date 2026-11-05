
import java.util.HashMap;

public class Main {
    public static void main(String[] args) {
        Alienigena alienigena = new Alienigena("Serpo");
        EspiritoYoukai espirito = new EspiritoYoukai("Turbo Granny");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();
        mapa.registrar("Escola", alienigena);
        mapa.registrar("Túnel", espirito);

        mapa.investigar("Escola");
        mapa.investigar("Túnel");
        mapa.investigar("Parque");
    }
}

interface Sobrenatural {
    void manifestar();
}

class Alienigena implements Sobrenatural {
    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " apareceu em uma nave espacial.");
    }
}

class EspiritoYoukai implements Sobrenatural {
    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " apareceu e assustou os estudantes.");
    }
}

class MapaDeAvistamentos {
    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        this.avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        Sobrenatural ser = avistamentos.get(local);

        if (ser == null) {
            System.out.println(local + " está tranquilo.");
        } else {
            ser.manifestar();
        }
    }
}

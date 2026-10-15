
class HeroiOverwatch:

    def __init__(self, codinome, funcao):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"{self.codinome} usou uma suprema generica!")


class HeroiTanque(HeroiOverwatch):

    def usar_suprema(self):
        print(f"{self.codinome} usou a suprema de tanque!")


class HeroiSuporte(HeroiOverwatch):

    def usar_suprema(self):
        print(f"{self.codinome} usou a suprema de suporte!")

    def curar_equipe(self):
        print(f"{self.codinome} curou a equipe!")


if __name__ == "__main__":

    heroi1 = HeroiOverwatch("Soldado 76", "Dano")
    heroi2 = HeroiTanque("Reinhardt", "Tanque")
    heroi3 = HeroiSuporte("Mercy", "Suporte")

    herois: list[HeroiOverwatch] = [heroi1, heroi2, heroi3]

    for heroi in herois:
        heroi.usar_suprema()

        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()

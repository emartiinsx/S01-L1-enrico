
class MortoVivo:

    def __init__(self, nome, almas, estus):
        self.nome = nome
        self._almas = almas
        self.__estus = estus

    def get_estus(self):
        return self.__estus

    def set_estus(self, quantidade):
        if quantidade < 0:
            print("Quantidade de Estus inválida!")
        elif quantidade > 10:
            print("Quantidade de Estus inválida!")
        else:
            self.__estus = quantidade

    def mostrar_status(self):
        return f"Morto-vivo {self.nome} | Almas: {self._almas} | Estus: {self.__estus}"


class Clerigo(MortoVivo):

    def __init__(self, nome, almas, estus, milagre):
        super().__init__(nome, almas, estus)
        self.milagre = milagre

    def mostrar_status(self):
        return super().mostrar_status() + f" | Milagre: {self.milagre}"


if __name__ == "__main__":

    clerigo = Clerigo("Petrus", 2000, 5, "Cura")

    print(clerigo.mostrar_status())

    clerigo.set_estus(15)
    print(clerigo.mostrar_status())

    clerigo.set_estus(10)
    print(clerigo.mostrar_status())

    # print(clerigo.__estus)

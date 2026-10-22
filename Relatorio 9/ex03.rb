
class PhoneWave
  def enviar_dmail(mensagem)
    puts "Mensagem: #{mensagem}"
    puts "A mensagem foi enviada para o passado!"
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Membro #{membro.numero}: #{membro.nome} foi admitido."
  end

  def experimento(mensagem)
    puts "Membros presentes:"
    @membros.each do |membro|
      puts "#{membro.numero} - #{membro.nome}"
    end
    @phonewave.enviar_dmail(mensagem)
  end
end

okabe = MembroDoLab.new(1, "Okabe")
mayuri = MembroDoLab.new(2, "Mayuri")

laboratorio = LaboratorioDeGadgets.new
laboratorio.admitir(okabe)
laboratorio.admitir(mayuri)
laboratorio.experimento("O experimento começou")

# Composição: o PhoneWave é criado dentro do laboratório.
# Agregação: os membros são criados antes e depois adicionados ao laboratório.

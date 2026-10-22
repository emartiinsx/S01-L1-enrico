
module Depoente
  def depor
    raise NotImplementedError, "Deve implementar depor"
  end
end

module Detivel
  def ser_detido
    puts "#{nome} foi levado pela Scotland Yard."
  end
end

class Envolvido
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end

class TestemunhaOcular < Envolvido
  include Depoente

  def depor
    puts "#{nome} viu alguém saindo da casa."
  end
end

class SuspeitoDoCrime < Envolvido
  include Depoente
  include Detivel

  def depor
    puts "#{nome} diz que estava em casa na hora do crime."
  end
end

class Investigacao
  def initialize(caso)
    @caso = caso
    @envolvidos = []
  end

  def registrar(envolvido)
    @envolvidos << envolvido
  end

  def ouvir_todos
    puts "Caso: #{@caso}"
    @envolvidos.each do |envolvido|
      envolvido.depor
    end
  end

  def acionar_scotland_yard
    suspeitos = @envolvidos.select { |envolvido| envolvido.respond_to?(:ser_detido) }
    suspeitos.each do |suspeito|
      suspeito.ser_detido
    end
  end
end

testemunha = TestemunhaOcular.new("Watson")
suspeito1 = SuspeitoDoCrime.new("Moriarty")
suspeito2 = SuspeitoDoCrime.new("John")

investigacao = Investigacao.new("Mistério em Baker Street")
investigacao.registrar(testemunha)
investigacao.registrar(suspeito1)
investigacao.registrar(suspeito2)
investigacao.ouvir_todos
investigacao.acionar_scotland_yard

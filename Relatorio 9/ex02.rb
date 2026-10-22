
class Instrumentista
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def interpretar(peca)
    raise NotImplementedError, "Instrumentista deve implementar interpretar"
  end
end

class Solista < Instrumentista
  def interpretar(peca)
    puts "#{nome} toca #{instrumento} em #{peca} e conduz a melodia principal."
  end
end

class Acompanhador < Instrumentista
  def interpretar(peca)
    puts "#{nome} toca #{instrumento} em #{peca} e acompanha o ritmo do solista."
  end
end

class Regente
  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  def convocar(instrumentista)
    @orquestra << instrumentista
  end

  def reger(peca)
    puts "#{@nome} rege a peça #{peca}."
    @orquestra.each do |instrumentista|
      instrumentista.interpretar(peca)
    end
  end

  def escalacao
    @orquestra.map { |instrumentista| "#{instrumentista.class} - #{instrumentista.nome}" }
  end
end

solista = Solista.new("Kousei", "piano")
acompanhador = Acompanhador.new("Kaori", "violino")
regente = Regente.new("Maestro")

regente.convocar(solista)
regente.convocar(acompanhador)
regente.reger("Primavera")

regente.escalacao.each do |musico|
  puts musico
end

instrumentista = Instrumentista.new("Teste", "piano")
# instrumentista.interpretar("Primavera")

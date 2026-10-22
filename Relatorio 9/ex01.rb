
class CoquetelAfterlife
  attr_reader :nome

  def initialize(nome, preco)
    @nome = nome
    @_preco = preco
  end

  def preco
    @_preco
  end

  def preco=(valor)
    if valor >= 5 && valor <= 200
      @_preco = valor
    else
      puts "Preço inválido!"
    end
  end

  def ficha
    "Drink: #{@nome} - Preço: #{preco} eurodólares"
  end
end

class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  def ficha
    "#{super} - Lenda: #{@lenda}"
  end
end

comum = CoquetelAfterlife.new("Afterlife Especial", 30)
lenda1 = DrinkDeLenda.new("Silverhand", 50, "Johnny Silverhand")
lenda2 = DrinkDeLenda.new("Jackie Welles", 45, "Jackie Welles")

drinks = [comum, lenda1, lenda2]

drinks.each do |drink|
  puts drink.ficha
end

lenda1.preco = 500
lenda1.preco = 80
puts lenda1.ficha

# lenda1.nome = "Outro nome"

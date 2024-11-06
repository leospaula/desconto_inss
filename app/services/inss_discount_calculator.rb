class InssDiscountCalculator
  FAIXAS = [
    { limite: 1045.00, aliquota: 0.075 },
    { limite: 2089.60, aliquota: 0.09 },
    { limite: 3134.40, aliquota: 0.12 },
    { limite: 6101.06, aliquota: 0.14 }
  ]

  def initialize(salario)
    @salario = salario
  end

  def call
    calcular_desconto
  end

  private

  def calcular_desconto
    desconto = 0.0
    salario_restante = @salario

    FAIXAS.each do |faixa|
      if salario_restante > faixa[:limite]
        desconto += faixa[:limite] * faixa[:aliquota]
        salario_restante -= faixa[:limite]
      else
        desconto += salario_restante * faixa[:aliquota]
        break
      end
    end

    desconto.round(2)
  end
end
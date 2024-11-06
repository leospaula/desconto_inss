class InssReportPresenter
  FAIXAS = [
    { nome: "Até R$ 1.045,00", min: 0, limite: 1045.00 },
    { nome: "De R$ 1.045,01 a R$ 2.089,60", min: 1045.00, limite: 2089.60 },
    { nome: "De R$ 2.089,61 até R$ 3.134,40", min: 2089.60, limite: 3134.40 },
    { nome: "De R$ 3.134,41 até R$ 6.101,06", min: 3134.40, limite: 6101.06 }
  ]

  def initialize(proponentes)
    @proponentes = proponentes
  end

  def group_by_salary_range
    FAIXAS.map do |faixa|
      {
        faixa: faixa[:nome],
        quantidade: @proponentes.where(salario: faixa[:min]..faixa[:limite]).count
      }
    end
  end
end
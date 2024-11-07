require 'rails_helper'

RSpec.describe InssReportPresenter do
  let!(:proponente1) { create(:proponente, salario: 1000.00) }   # Faixa 1
  let!(:proponente2) { create(:proponente, salario: 1500.00) }   # Faixa 2
  let!(:proponente3) { create(:proponente, salario: 2500.00) }   # Faixa 3
  let!(:proponente4) { create(:proponente, salario: 3500.00) }   # Faixa 4
  let!(:proponente5) { create(:proponente, salario: 6000.00) }   # Faixa 4

  describe "#group_by_salary_range" do
    it "agrupa corretamente os proponentes por faixa salarial" do
      report = InssReportPresenter.new(Proponente.all).group_by_salary_range

      expect(report).to match_array([
        { faixa: "Até R$ 1.045,00", quantidade: 1 },
        { faixa: "De R$ 1.045,01 a R$ 2.089,60", quantidade: 1 },
        { faixa: "De R$ 2.089,61 até R$ 3.134,40", quantidade: 1 },
        { faixa: "De R$ 3.134,41 até R$ 6.101,06", quantidade: 2 }
      ])
    end
  end
end

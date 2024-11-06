require 'rails_helper'

RSpec.describe UpdateSalaryService do
  let(:proponente) { create(:proponente, salario: 3000.00) }

  describe '#call' do
    context 'quando o novo salário é válido' do
      it 'atualiza o salário do proponente' do
        novo_salario = 4000.00
        service = UpdateSalaryService.new(proponente, novo_salario)

        expect { service.call }.to change { proponente.reload.salario }.from(3000.00).to(4000.00)
      end
    end

    context 'quando o novo salário é inválido' do
      it 'não atualiza o salário e lança um erro' do
        novo_salario = -500.00
        service = UpdateSalaryService.new(proponente, novo_salario)

        expect { service.call }.to raise_error(ArgumentError, "O salário deve ser maior que zero")
      end
    end
  end
end
class UpdateSalaryService
  def initialize(proponente, novo_salario)
    @proponente = proponente
    @novo_salario = novo_salario
  end

  def call
    update_salary
  end

  private

  def update_salary
    if @novo_salario > 0
      desconto_inss = InssDiscountCalculator.new(@novo_salario).call
      @proponente.update!(salario: @novo_salario, desconto_inss: desconto_inss)
    else
      raise ArgumentError, "O salário deve ser maior que zero"
    end
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error("Erro ao atualizar salário: #{e.message}")
    false
  end
end

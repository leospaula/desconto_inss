class UpdateSalaryJob < ApplicationJob
  queue_as :default

  def perform(proponente_id, novo_salario)
    proponente = Proponente.find(proponente_id)
    UpdateSalaryService.new(proponente, novo_salario).call
  end
end

require 'rails_helper'

RSpec.describe UpdateSalaryJob, type: :job do
  let(:proponente) { create(:proponente, salario: 3000.00) }
  let(:novo_salario) { 4000.00 }

  it "invoca o serviço de atualização de salário com os parâmetros corretos" do
    service = instance_double("UpdateSalaryService")
    allow(UpdateSalaryService).to receive(:new).with(proponente, novo_salario).and_return(service)
    allow(service).to receive(:call)

    UpdateSalaryJob.perform_now(proponente.id, novo_salario)

    expect(UpdateSalaryService).to have_received(:new).with(proponente, novo_salario)
    expect(service).to have_received(:call)
  end
end

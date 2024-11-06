require 'rails_helper'

RSpec.describe Proponente, type: :model do
  it "é válido com atributos válidos" do
    proponente = build(:proponente)

    expect(proponente).to be_valid
  end

  it "é inválido sem um nome, cpf, data de nascimento ou salario" do
    proponente = build(:proponente, nome: nil, cpf: nil, data_nascimento: nil, salario: nil)
    proponente.valid?
    expect(proponente.errors[:nome]).to include("não pode ficar em branco")
    expect(proponente.errors[:cpf]).to include("não pode ficar em branco")
    expect(proponente.errors[:data_nascimento]).to include("não pode ficar em branco")
    expect(proponente.errors[:salario]).to include("não pode ficar em branco")
  end

  it "é inválido com formato do cpf errado" do
    proponente = build(:proponente, cpf: "123456789")
    proponente.valid?
    expect(proponente.errors[:cpf]).to include("deve conter 11 dígitos")
  end

  it "é inválido com um CPF duplicado" do
    create(:proponente, cpf: "12345678901")
    proponente = build(:proponente, cpf: "12345678901")
    proponente.valid?
    expect(proponente.errors[:cpf]).to include("já está em uso")
  end

  it "é inválido com endereco e telefone incorretos" do
    proponente = build(:proponente,
                      endereco: { logradouro: "Rua A", numero: "123",
                                  bairro: "Bairro B", cidade: "Cidade C" },
                      telefones: "987654321")
    proponente.valid?
    expect(proponente.errors[:endereco]).to include("inválido")
    expect(proponente.errors[:telefones]).to include("inválido")
  end
end
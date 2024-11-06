require 'rails_helper'

RSpec.describe Proponente, type: :model do
  it "é válido com atributos válidos" do
    proponente = Proponente.new(nome: "João Silva", cpf: "12345678901",
                                data_nascimento: "1990-01-01", salario: 3000.0,
                                endereco: { logradouro: "Rua A", numero: "123",
                                            bairro: "Bairro B", cidade: "Cidade C",
                                            estado: "Estado D", cep: "12345000" },
                                telefones: ["123456789", "987654321"])
    expect(proponente).to be_valid
  end

  it "é inválido sem um nome, cpf, data de nascimento ou salario" do
    proponente = Proponente.new(nome: nil, cpf: nil, data_nascimento: nil, salario: nil)
    proponente.valid?
    expect(proponente.errors[:nome]).to include("não pode ficar em branco")
    expect(proponente.errors[:cpf]).to include("não pode ficar em branco")
    expect(proponente.errors[:data_nascimento]).to include("não pode ficar em branco")
    expect(proponente.errors[:salario]).to include("não pode ficar em branco")
  end

  it "é inválido com formato do cpf errado" do
    proponente = Proponente.new(cpf: "123456789")
    proponente.valid?
    expect(proponente.errors[:cpf]).to include("deve conter 11 dígitos")
  end

  it "é inválido com um CPF duplicado" do
    Proponente.create!(nome: "João Silva", cpf: "12345678901",
                      data_nascimento: "1990-01-01", salario: 3000.0,
                      endereco: { logradouro: "Rua A", numero: "123",
                                  bairro: "Bairro B", cidade: "Cidade C",
                                  estado: "Estado D", cep: "12345000" },
                      telefones: ["123456789", "987654321"])
    proponente = Proponente.new(nome: "Maria Silva", cpf: "12345678901")
    proponente.valid?
    expect(proponente.errors[:cpf]).to include("já está em uso")
  end

  it "é inválido com endereco e telefone incorretos" do
    proponente = Proponente.new(nome: "João Silva", cpf: "12345678901",
                      data_nascimento: "1990-01-01", salario: 3000.0,
                      endereco: { logradouro: "Rua A", numero: "123",
                                  bairro: "Bairro B", cidade: "Cidade C"
                                },
                      telefones: "987654321")
    proponente.valid?
    expect(proponente.errors[:endereco]).to include("inválido")
    expect(proponente.errors[:telefones]).to include("inválido")
  end
end
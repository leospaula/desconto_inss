FactoryBot.define do
  factory :proponente do
    nome { "Nome Exemplo" }
    cpf { rand(12**9..12**10).to_s }
    data_nascimento { "1990-01-01" }
    endereco { { logradouro: "Rua A", numero: "123", bairro: "Bairro B", cidade: "Cidade C", estado: "SP", cep: "12345000" } }
    telefones { ["123456789", "987654321"] }
    salario { 1000.0 }
  end
end
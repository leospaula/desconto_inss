FactoryBot.define do
  factory :proponente do
    nome { Faker::Name.name }
    cpf { Faker::IdNumber.brazilian_cpf }
    data_nascimento { Faker::Date.birthday(min_age: 18, max_age: 65) }
    endereco { { logradouro: "Rua A", numero: "123", bairro: "Bairro B", cidade: "Cidade C", estado: "SP", cep: "12345000" } }
    telefones { [ "123456789", "987654321" ] }
    salario { rand(1000..7000) }
  end
end

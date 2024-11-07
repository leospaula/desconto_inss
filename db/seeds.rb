# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

Proponente.destroy_all

puts "Base de dados limpa. Todos os proponentes foram removidos."

10.times do
  salario = Faker::Number.decimal(l_digits: 4, r_digits: 2)
  Proponente.create!(
    nome: Faker::Name.name,
    cpf: Faker::IdNumber.brazilian_cpf,
    data_nascimento: Faker::Date.birthday(min_age: 18, max_age: 65),
    endereco: {
      logradouro: Faker::Address.street_name,
      numero: Faker::Address.building_number,
      bairro: Faker::Address.community,
      cidade: Faker::Address.city,
      estado: Faker::Address.state_abbr,
      cep: Faker::Address.zip
    },
    telefones: [ "123456789", "987654321" ],
    salario: salario,
    desconto_inss: InssDiscountCalculator.new(salario).call
  )
end

puts "10 proponentes criados com sucesso!"

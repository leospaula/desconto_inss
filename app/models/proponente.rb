class Proponente < ApplicationRecord
  validates :nome, :data_nascimento, :cpf, :salario, presence: { message: "não pode ficar em branco" }
  validates :cpf, uniqueness: { message: "já está em uso" }, format: { with: /\A\d{11}\z/, message: "deve conter 11 dígitos" }
  validates :salario, numericality: { greater_than: 0 }
  validate :validar_endereco, :validar_telefones

  private

  def validar_endereco
    errors.add(:endereco, "inválido") unless endereco.is_a?(Hash) && endereco.key?('logradouro') &&
                                            endereco.key?('numero') && endereco.key?('bairro') &&
                                            endereco.key?('cidade') && endereco.key?('estado') &&
                                            endereco.key?('cep')
  end

  def validar_telefones
    errors.add(:telefones, "inválido") unless telefones.is_a?(Array) && telefones.all? { |tel| tel.match(/\A\d+\z/) }
  end
end

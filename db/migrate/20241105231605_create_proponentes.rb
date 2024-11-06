class CreateProponentes < ActiveRecord::Migration[7.2]
  def change
    create_table :proponentes do |t|
      t.string :nome
      t.string :cpf
      t.date :data_nascimento
      t.json :endereco
      t.json :telefones
      t.decimal :salario
      t.decimal :desconto_inss

      t.timestamps
    end
  end
end

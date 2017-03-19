class CreateEstudantes < ActiveRecord::Migration[5.0]
  def change
    create_table :estudantes do |t|
      t.string  :nome
      t.string  :numero_de_registro
      t.integer :estudante_status

      t.timestamps
    end
  end
end

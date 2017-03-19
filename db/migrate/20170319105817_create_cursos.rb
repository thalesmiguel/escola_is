class CreateCursos < ActiveRecord::Migration[5.0]
  def change
    create_table :cursos do |t|
      t.string :nome
      t.string :descricao
      t.integer :curso_status

      t.timestamps
    end
  end
end

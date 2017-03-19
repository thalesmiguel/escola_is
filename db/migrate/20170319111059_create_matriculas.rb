class CreateMatriculas < ActiveRecord::Migration[5.0]
  def change
    create_table :matriculas do |t|
      t.references :estudante, foreign_key: true
      t.references :curso, foreign_key: true

      t.timestamps
    end
  end
end

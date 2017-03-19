class Estudante < ApplicationRecord
  extend EnumerateIt
  has_enumeration_for :estudante_status

  validates :nome, presence: true

  has_many :matriculas, dependent: :destroy
  has_many :cursos, through: :matriculas
end

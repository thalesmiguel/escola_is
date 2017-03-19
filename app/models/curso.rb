class Curso < ApplicationRecord
  extend EnumerateIt
  has_enumeration_for :curso_status

  validates :nome, presence: true

  has_many :matriculas, dependent: :destroy
  has_many :estudantes, through: :matriculas
end

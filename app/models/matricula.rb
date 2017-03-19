class Matricula < ApplicationRecord
  belongs_to :estudante
  belongs_to :curso

  validates :estudante, presence: true
  validates :curso, presence: true
end

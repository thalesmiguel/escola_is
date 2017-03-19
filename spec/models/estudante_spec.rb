require 'rails_helper'

RSpec.describe Estudante, type: :model do

  describe "Associações" do
    it { should have_many(:matriculas).dependent(:destroy) }
    it { should have_many(:cursos).through(:matriculas) }
  end

  describe "Validações" do
    it { should validate_presence_of(:nome) }
  end
end

require 'rails_helper'

RSpec.describe Matricula, type: :model do

  describe "Associações" do
    it { should belong_to(:curso) }
    it { should belong_to(:estudante) }
  end

  describe "Validações" do
    it { should validate_presence_of(:curso) }
    it { should validate_presence_of(:estudante) }
  end
end

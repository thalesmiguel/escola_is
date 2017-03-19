require 'rails_helper'

RSpec.describe "estudantes/show", type: :view do
  before(:each) do
    @estudante = assign(:estudante, Estudante.create!(
      :nome => "Nome",
      :numero_de_registro => "Numero De Registro"
    ))
  end

  it "renderiza atributos" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Numero De Registro/)
  end
end

require 'rails_helper'

RSpec.describe "estudantes/index", type: :view do
  before(:each) do
    assign(:estudantes, [
      Estudante.create!(
        :nome => "Nome",
        :numero_de_registro => "Numero De Registro"
      ),
      Estudante.create!(
        :nome => "Nome",
        :numero_de_registro => "Numero De Registro"
      )
    ])
  end

  it "renderiza uma lista de estudantes" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Numero De Registro".to_s, :count => 2
  end
end

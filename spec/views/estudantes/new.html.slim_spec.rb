require 'rails_helper'

RSpec.describe "estudantes/new", type: :view do
  before(:each) do
    assign(:estudante, Estudante.new(
      :nome => "MyString",
      :numero_de_registro => "MyString"
    ))
  end

  it "renderiza o formulário" do
    render

    assert_select "form[action=?][method=?]", estudantes_path, "post" do

      assert_select "input#estudante_nome[name=?]", "estudante[nome]"

      assert_select "input#estudante_numero_de_registro[name=?]", "estudante[numero_de_registro]"
    end
  end
end

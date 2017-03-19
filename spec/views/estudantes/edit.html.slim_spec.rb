require 'rails_helper'

RSpec.describe "estudantes/edit", type: :view do
  before(:each) do
    @estudante = assign(:estudante, Estudante.create!(
      :nome => "MyString",
      :numero_de_registro => "MyString"
    ))
  end

  it "renderiza o formulário" do
    render

    assert_select "form[action=?][method=?]", estudante_path(@estudante), "post" do

      assert_select "input#estudante_nome[name=?]", "estudante[nome]"

      assert_select "input#estudante_numero_de_registro[name=?]", "estudante[numero_de_registro]"
    end
  end
end

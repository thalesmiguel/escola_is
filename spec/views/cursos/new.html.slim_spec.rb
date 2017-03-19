require 'rails_helper'

RSpec.describe "cursos/new", type: :view do
  before(:each) do
    assign(:curso, Curso.new(
      :nome => "MyString",
      :descricao => "MyString",
      :curso_status => ""
    ))
  end

  it "renderiza formulário" do
    render

    assert_select "form[action=?][method=?]", cursos_path, "post" do

      assert_select "input#curso_nome[name=?]", "curso[nome]"

      assert_select "input#curso_descricao[name=?]", "curso[descricao]"

      assert_select "select#curso_curso_status[name=?]", "curso[curso_status]"
    end
  end
end

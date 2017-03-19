require 'rails_helper'

RSpec.describe "cursos/index", type: :view do
  before(:each) do
    assign(:cursos, [
      Curso.create!(
        :nome => "Nome",
        :descricao => "Descricao",
        :curso_status => ""
      ),
      Curso.create!(
        :nome => "Nome",
        :descricao => "Descricao",
        :curso_status => ""
      )
    ])
  end

  it "renderiza lista de cursos" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end

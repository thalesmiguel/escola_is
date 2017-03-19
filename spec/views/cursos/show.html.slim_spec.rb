require 'rails_helper'

RSpec.describe "cursos/show", type: :view do
  before(:each) do
    @curso = assign(:curso, Curso.create!(
      :nome => "Nome",
      :descricao => "Descricao",
      :curso_status => ""
    ))
  end

  it "renderiza atributos" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(//)
  end
end

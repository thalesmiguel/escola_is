class MatriculasController < ApplicationController
  before_action :set_matricula, only: [:show, :edit, :update, :destroy]
  before_action :set_cursos, only: [:new, :edit]
  before_action :set_estudantes, only: [:new, :edit]

  respond_to :html

  def index
    @matriculas = Matricula.all
    respond_with(@matriculas)
  end

  def show
    respond_with(@matricula)
  end

  def new
    @matricula = Matricula.new
    respond_with(@matricula)
  end

  def edit
  end

  def create
    @matricula = Matricula.new(matricula_params)
    @matricula.save
    respond_with(@matricula)
  end

  def update
    @matricula.update(matricula_params)
    respond_with(@matricula)
  end

  def destroy
    @matricula.destroy
    respond_with(@matricula)
  end

  private
    def set_matricula
      @matricula = Matricula.find(params[:id])
    end

    def set_estudantes
      @estudantes = Estudante.all
    end

    def set_cursos
      @cursos = Curso.all
    end

    def matricula_params
      params.require(:matricula).permit(:estudante_id, :curso_id)
    end
end

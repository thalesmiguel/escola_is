class EstudantesController < ApplicationController
  before_action :set_estudante, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @estudantes = Estudante.all
    respond_with(@estudantes)
  end

  def show
    respond_with(@estudante)
  end

  def new
    @estudante = Estudante.new
    respond_with(@estudante)
  end

  def edit
  end

  def create
    @estudante = Estudante.new(estudante_params)
    @estudante.save
    respond_with(@estudante)
  end

  def update
    @estudante.update(estudante_params)
    respond_with(@estudante)
  end

  def destroy
    @estudante.destroy
    respond_with(@estudante)
  end

  private
    def set_estudante
      @estudante = Estudante.find(params[:id])
    end

    def estudante_params
      params.require(:estudante).permit(:nome, :numero_de_registro)
    end
end

class ProponentesController < ApplicationController
  def index
    @proponentes = Proponente.page(params[:page]).per(5)
  end

  def new
    @proponente = Proponente.new
  end

  def create
    @proponente = Proponente.new(proponente_params)
    if @proponente.save
      redirect_to proponentes_path, notice: 'Proponente criado com sucesso.'
    else
      render :new
    end
  end

  private

  def proponente_params
    params.require(:proponente).permit(:nome, :cpf, :data_nascimento, :salario, endereco: {}, telefones: [])
  end
end

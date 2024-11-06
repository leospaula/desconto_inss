class ProponentesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :atualizar_salario, :relatorio]
  before_action :set_proponente, only: [:show, :atualizar_salario]

  def index
    @proponentes = Proponente.page(params[:page]).per(5)
  end

  def show; end

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

  def calcular_inss
    salario = params[:salario].to_f
    desconto_inss = InssDiscountCalculator.new(salario).call
    render json: { desconto_inss: desconto_inss }
  end

  def relatorio
    @report_data = InssReportPresenter.new(Proponente.all).group_by_salary_range
  end

  def atualizar_salario
    novo_salario = params[:novo_salario].to_f
    if novo_salario > 0
      UpdateSalaryJob.perform_later(@proponente.id, novo_salario)
      redirect_to @proponente, notice: 'Atualização de salário em processamento.'
    else
      redirect_to @proponente, alert: 'Erro: o salário deve ser maior que zero.'
    end  
  end

  private

  def set_proponente
    @proponente = Proponente.find(params[:id])
  end

  def proponente_params
    params.require(:proponente).permit(:nome, :cpf, :data_nascimento, :salario, :desconto_inss, endereco: {}, telefones: [])
  end
end

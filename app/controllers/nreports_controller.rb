class NreportsController < ApplicationController
  before_action :require_user_logged_in
  def index
    @patients = Patient.all.includes(:nreports)
    @nreports = Nreport.all
  end

  def show
    @patient = Patient.find(params[:id])
    @nreports = @patient.nreports
  end

  def new
    @nreport = Nreport.new
  end

  def create
    @nreport = Nreport.new(nreport_params)

    if @nreport.save
      flash[:success] = '正常に投稿されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def edit
    @nreport = Nreport.find(params[:id])
  end

  def update
    @nreport = Nreport.find(params[:id])

    if @nreport.update(nreport_params)
      flash[:success] = '正常に更新されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @nreport = Nreport.find(params[:id])
    @nreport.destroy

    flash[:success] = '正常に削除されました'
    redirect_to nreports_url

  end

  private

  def nreport_params
    params.require(:nreport).permit(:patient_id,
:nrs,:nro,:nra,:nrp,:nrt,:nrn,:nrm
    )
  end

end

class PatientsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @patients = Patient.all
    @count_patients = Patient.count
    
    respond_to do |format|
      format.html
      format.csv { send_data @patients.to_csv }
      format.xls { send_data @patients.to_csv(col_sep: "\t") }
    end
  end

def import
  # fileはtmpに自動で一時保存される
  Patient.import(params[:file])
  redirect_to patients_url, notice: "商品を追加しました。"
end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      flash[:success] = '正常に投稿されました'
      redirect_to @patient
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end
  
  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      flash[:success] = '正常に更新されました'
      redirect_to @patient
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    flash[:success] = '正常に削除されました'
    redirect_to patients_url
  end

  private


  def patient_params
    params.require(:patient).permit(
    :p_name,:p_kana,:hos_date,:room_no,:birth_date,:gender,
    :diagnosis,:med_history,:bloodtype,:height,:weight,:infection,
    :allergic,:aid,:attention,:post,:address,:wish,:notice,:recognition,
    :life,:ps,:hand_mmt,:foot_mmt,:vision,:hearing,:verbal,
    :skin,:excretion,:iadl,:consciousness,:understanding,
    :keyp1,:connection,:family,:house,:impact,:relationship,
    :friend,:occupation,:position,:good_p,:bad_p,:value,
    :hobby,:anniversary,:fa_prob,:age
    )
  end
end





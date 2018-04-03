class ObservationsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @patient = current_patient
    @q        = @patient.Observation.search(params[:q])
    @observations = @q.result(distinct: true)

    respond_to do |format|
      format.html
      format.csv { send_data @observations.to_csv }
      format.xls { send_data @observations.to_csv(col_sep: "\t") }
    end

    def import
      # fileはtmpに自動で一時保存される
      Observation.import(params[:file])
      redirect_to observations_url, notice: "追加しました。"
    end
  end

  def show
    #@observation = Observation.find(params[:id])
    @patient = Patient.find(params[:patient_id])
    @observation = @patient.observations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @observation }
    end
  end

  def new
    #@observation = Observation.new
    @patient = current_patient
    @observation = current_patient.observations.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @observation }
    end
  end

  def create
    @observation = current_patient.observations.build(observation_params)
    if @observation.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_back(fallback_location: root_path)
    else
      @observations = current_patient.observations.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      redirect_back(fallback_location: root_path)
    end
  end

  
  def edit
    #@observation = Observation.find(params[:id])
    @patient = Patient.find(params[:patient_id])
    @observation = @patient.observations.find(params[:id])
  end

  def update
    #@observation = Observation.find(params[:id])
    @patient = Patient.find(params[:patient_id])
    @observation = @patient.observations.find(params[:id])

    if @observation.update(observation_params)
      flash[:success] = '正常に更新されました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @observation.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end


  private


  def observation_params
    params.require(:observation).permit(:category, :ob_name, 
    :n_1d, :j_1d, :s_2d, :n_2d, :j_2d, :s_3d, :n_3d, :j_3d, :s_4d
    )
  end
  
    def current_patient
      @current_patient ||= Patient.find_by(id: params[:patient_id])
    end
  
end
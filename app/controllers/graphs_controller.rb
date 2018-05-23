class GraphsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
@patients = Patient.all.includes(:kansatus)
  end

  def show
    
    @patient = Patient.find(params[:id])
    @kansatus = @patient.kansatus

    @taions = @kansatus.where(:ob_name => "体温")
    @myakus = @kansatus.where(:ob_name => "脈拍")
    @bpus = @kansatus.where(:ob_name => "収縮期血圧")
    @bpds = @kansatus.where(:ob_name => "拡張期血圧")
    @kokyus = @kansatus.where(:ob_name => "呼吸")

  end
  


  private
  # Strong Parameter
    def current_patient
      @current_patient ||= Patient.find_by(id: params[:patient_id])
    end

end

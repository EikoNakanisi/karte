class GraphsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
@patients = Patient.all.includes(:kansatus)
  end

  def show
    
    @patient = Patient.find(params[:id])
    @kansatus = @patient.kansatus
    
  end


  private
  # Strong Parameter
    def current_patient
      @current_patient ||= Patient.find_by(id: params[:patient_id])
    end

end

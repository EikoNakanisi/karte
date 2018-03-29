class ObservationsController < ApplicationController

  def index
    @q        = Observation.search(params[:q])
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



  private





  def observation_params
    params.require(:observation).permit(:category, :ob_name, :pt_no,
    :n_1d, :j_1d, :s_2d, :n_2d, :j_2d, :s_3d, :n_3d, :j_3d, :s_4d
    )
  end
end
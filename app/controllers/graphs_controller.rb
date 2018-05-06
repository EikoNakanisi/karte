class GraphsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
@patients = Patient.all.includes(:kansatus)
  end

  def show
    
    @patient = Patient.find(params[:id])
    @kansatus = @patient.kansatus
    
    # (...データベースからのデータ取得処理...)
    # ダミーのデータを用意
    months = ['日勤', '準夜', '深夜', '日勤', '準夜',
            '深夜', '日勤', '準夜', '深夜']
    color = ['#1E90FF', '#FF69B4', '#32CD32', '#32CD32', '#708090']
    vs_A = [36.2, 36.9, 36.9, 36.5, 35.8, 37.0, 35.6, 38.5, 36.4]
    vs_B = [88, 87, 85, 90, 78, 86, 80, 66, 78] 
    vs_C = [140, 132, 134, 145, 182, 111, 125, 126, 140] 
    vs_D = [80, 82, 74, 75, 82, 91, 85, 76, 70] 
    vs_E = [12, 15, 16, 14, 18, 21, 20, 22, 18]




    # グラフ（チャート）を作成 
    @chart = LazyHighCharts::HighChart.new("graph") do |c|
#      c.title(text: "")
c.chart(zoomType: 'xy')


  c.legend(align: 'left', verticalAlign: 'top', borderWidth: 0)
      c.colors(colors: color)
      c.xAxis(categories: months, crosshair: true)
      c.series(symbol: 'triangle', name: "体温", data: vs_A)
      c.series(symbol: 'triangle', name: "脈拍", data: vs_B, dashStyle: 'ShortDash')
      c.series(symbol: 'triangle',name: "収縮期血圧", data: vs_C, dashStyle: 'Dot')
      c.series(symbol: 'triangle',name: "拡張期血圧", data: vs_D, dashStyle: 'Dot')
      c.series(name: "呼吸", data: vs_E,  dashStyle:'shortdot')

    end
  end
  


  private
  # Strong Parameter
    def current_patient
      @current_patient ||= Patient.find_by(id: params[:patient_id])
    end

end

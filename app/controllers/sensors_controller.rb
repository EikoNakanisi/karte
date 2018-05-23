class SensorsController < ApplicationController
  def index
    @sensors = Sensor.all
    @sensor_abc = Sensor.order("id").where(:datatype => "abc").select("created_at", "data")
  pivotes = Sensor.pluck(:datatype, :data) #pluckは指定したカラムの配列を取得
  @labels = pivotes.map(&:first)
  @datas = pivotes.map(&:second)


    gon.value = @sensors.first.datatype
    gon.user_name = 'テスト太郎'
    gon.user_age = 24
    gon.user_favorite_food = [@sensors.first.id, @sensors.first.datatype, @sensors.first.data]

  end

  def show
    @sensor = Sensor.find(params[:id])
  end
  
  def new
    @sensor = Sensor.new
  end

  def create
    @sensor = Sensor.new(sensor_params)

    if @sensor.save
      flash[:success] = 'Sensor が正常に投稿されました'
      redirect_to @sensor
    else
      flash.now[:danger] = 'Sensor が投稿されませんでした'
      render :new
    end
  end

  def edit
    @sensor = Sensor.find(params[:id])
  end
  
  def update
    @sensor = Sensor.find(params[:id])

    if @sensor.update(sensor_params)
      flash[:success] = 'Sensor は正常に更新されました'
      redirect_to @sensor
    else
      flash.now[:danger] = 'Sensor は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @sensor = Sensor.find(params[:id])
    @sensor.destroy

    flash[:success] = 'Sensor は正常に削除されました'
    redirect_to sensors_url
  end

  private

  # Strong Parameter
  def sensor_params
    params.require(:sensor).permit(:datatype, :data)
  end

end

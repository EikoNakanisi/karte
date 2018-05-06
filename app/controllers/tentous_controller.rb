class TentousController < ApplicationController

  before_action :require_user_logged_in

  def index
    @tentous = Tentou.all
    @q        = Tentou.search(params[:q])
    @tentous = @q.result(distinct: true)
    respond_to do |format|
      format.html
      format.csv { send_data @tentous.to_csv }
      format.xls { send_data @tentous.to_csv(col_sep: "\t") }
    end

    def import
      # fileはtmpに自動で一時保存される
      Tentou.import(params[:file])
      redirect_to tentous_url, notice: "追加しました。"
    end
  end

  def show
    @tentou = Tentou.find(params[:id])
  end

  def new
    @tentou = Tentou.new
  end

  def create
    @tentou = Tentou.new(tentou_params)

    if @tentou.save
      flash[:success] = '正常に投稿されました'
      redirect_to @tentou
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def edit
    @tentou = Tentou.find(params[:id])
  end

  def update
    @tentou = Tentou.find(params[:id])

    if @tentou.update(tentou_params)
      flash[:success] = '正常に更新されました'
      redirect_to @tentou
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tentou = Tentou.find(params[:id])
    @tentou.destroy

    flash[:success] = '正常に削除されました'
    redirect_to tentous_url

  end

  private

  def tentou_params
    params.require(:tentou).permit(:patient_id,:kisaibi,:age,:kiou,:katudou,:ninsiki,:haisetu,
:med1,:med2,:med3,:med4,:med5,:kankyo1,:kankyo2,:goukei,:kikendo,:yobou
    )
  end

end





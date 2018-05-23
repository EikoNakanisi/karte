class SaiketusController < ApplicationController
  before_action :require_user_logged_in

  def index
    @saiketus = Saiketu.all
    @q        = Saiketu.search(params[:q])
    @saiketus = @q.result(distinct: true)
    respond_to do |format|
      format.html
      format.csv { send_data @saiketus.to_csv }
      format.xls { send_data @saiketus.to_csv(col_sep: "\t") }
    end

    def import
      # fileはtmpに自動で一時保存される
      Saiketu.import(params[:file])
      redirect_to saiketus_url, notice: "追加しました。"
    end
  end

  def show
    @saiketu = Saiketu.find(params[:id])
  end


  def new
    @saiketu = Saiketu.new
  end

  def create
    @saiketu = Saiketu.new(saiketu_params)

    if @saiketu.save
      flash[:success] = '正常に投稿されました'
      redirect_to @saiketu
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def edit
    @saiketu = Saiketu.find(params[:id])
  end

  def update
    @saiketu = Saiketu.find(params[:id])

    if @saiketu.update(saiketu_params)
      flash[:success] = '正常に更新されました'
      redirect_to @saiketu
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @saiketu = Saiketu.find(params[:id])
    @saiketu.destroy

    flash[:success] = '正常に削除されました'
    redirect_to saiketus_url

  end

  private

  def saiketu_params
    params.require(:saiketu).permit(:patient_id,
    :tori_day,:koumoku,:kekka,:kekka_m,:sita,:ue,:tani
    )
  end

end


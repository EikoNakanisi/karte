class KansatusController < ApplicationController
  before_action :require_user_logged_in

  def index
    @kansatus = Kansatu.all
    @q        = Kansatu.search(params[:q])
    @kansatus = @q.result(distinct: true)
    respond_to do |format|
      format.html
      format.csv { send_data @kansatus.to_csv }
      format.xls { send_data @kansatus.to_csv(col_sep: "\t") }
    end

    def import
      # fileはtmpに自動で一時保存される
      Kansatu.import(params[:file])
      redirect_to kansatus_url, notice: "追加しました。"
    end
  end

  def show
    @kansatu = Kansatu.find(params[:id])
  end

  def new
    @kansatu = Kansatu.new
  end

  def create
    @kansatu = Kansatu.new(kansatu_params)

    if @kansatu.save
      flash[:success] = '正常に投稿されました'
      redirect_to @kansatu
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def edit
    @kansatu = Kansatu.find(params[:id])
  end

  def update
    @kansatu = Kansatu.find(params[:id])

    if @kansatu.update(kansatu_params)
      flash[:success] = '正常に更新されました'
      redirect_to @kansatu
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @kansatu = Kansatu.find(params[:id])
    @kansatu.destroy

    flash[:success] = '正常に削除されました'
    redirect_to kansatus_url

  end

  private

  def kansatu_params
    params.require(:kansatu).permit(:category, :ob_name, :patient_id,
    :n_1d, :j_1d, :s_2d, :n_2d, :j_2d, :s_3d, :n_3d, :j_3d, :s_4d
    )
  end

end


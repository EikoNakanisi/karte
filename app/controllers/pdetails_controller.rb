class PdetailsController < ApplicationController
  before_action :require_user_logged_in
  def index
    @plans = Plan.all.includes(:pdetails)
    @pdetails = Pdetail.all

    def import
      # fileはtmpに自動で一時保存される
      Pdetail.import(params[:file])
      redirect_to pdetails_url, notice: "追加しました。"
    end
  end

  def show
    @plan = Plan.find(params[:id])
    @pdetails = @plan.pdetails
  end

  def new
    @pdetail = Pdetail.new
  end

  def create
    @pdetail = Pdetail.new(pdetail_params)

    if @pdetail.save
      flash[:success] = '正常に投稿されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end


  def edit
    @pdetail = Pdetail.find(params[:id])
  end

  def update
    @pdetail = Pdetail.find(params[:id])

    if @pdetail.update(pdetail_params)
      flash[:success] = '正常に更新されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @pdetail = Pdetail.find(params[:id])
    @pdetail.destroy

    flash[:success] = '正常に削除されました'
    redirect_to pdetails_url

  end

  private

  def pdetail_params
    params.require(:pdetail).permit(:plan_id,
:kubun,:naiyo,:hyouka,:hyokad
    )
  end

end



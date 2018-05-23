class PlansController < ApplicationController
  before_action :require_user_logged_in
  def index
    @patients = Patient.all.includes(:plans)
    @plans = Plan.all
  end

  def show
    @patient = Patient.find(params[:id])
    @plans = @patient.plans
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      flash[:success] = '正常に投稿されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])

    if @plan.update(plan_params)
      flash[:success] = '正常に更新されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy

    flash[:success] = '正常に削除されました'
    redirect_to plans_url

  end

  private

  def plan_params
    params.require(:plan).permit(:patient_id,
:name,:touroku,:hyouka,:jikai,:konkyo,:sihyo_1,:sihyo_2,:sihyo_3,
:kanren_1,:kanren_2,:kanren_3,
:mokuhyo_1,:mokuhyo_2,:mokuhyo_3,:mokuhyo_4,:mokuhyo_5,
:mhyouka_1,:mhyouka_2,:mhyouka_3,:mhyouka_4,:mhyouka_5,
:mhyoud_1,:mhyoud_2,:mhyoud_3,:mhyoud_4,:mhyoud_5,:hyokad,:plno
    )
  end

end



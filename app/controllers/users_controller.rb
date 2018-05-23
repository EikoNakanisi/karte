class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update, :destroy]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.all.page(params[:page]).per(10)
    @count_users = User.count
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = '正常に更新されました'
      redirect_to @user
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = '正常に削除されました'
    redirect_to users_url
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :section, :password, :password_confirmation)
  end

    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end



end
class Admin::UsersController < ApplicationController
  #before_action :require_admin

  def index
    if current_user.admin?
      @users= User.all.includes(:tasks)
      @users= @users.page(params[:page]).per(5)
    else
      redirect_to tasks_path, notice: "「あなたは管理者ではありません」"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_path(@user), notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザー「#{@user.name}」を更新しました。"
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])

    unless @user == current_user
      @user.destroy
      flash[:notice] = "タスク「#{@user.name}」を削除しました。"
      redirect_to admin_users_path
    else
      if User.where(admin: :true).count > 1
        @user.destroy
        flash[:notice] = "タスク「#{@user.name}」を削除しました。"
        redirect_to admin_users_path
      else
        flash[:notice] = "管理者が最低一人必要です"
        redirect_to admin_users_url(@user)
      end
    end

  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def require_admin
    redirect_to root_path unless current_user.admin?
  end

end

class UsersController < ApplicationController
  skip_before_action :login_required

  def new
    if logged_in?
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "登録しました。"
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def show
    begin
      @user = current_user.users.find(params[:id])
    rescue
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def set_user
    begin
      @task = current_user.tasks.find(params[:id])
    rescue
      redirect_to tasks_url
    end
  end
end

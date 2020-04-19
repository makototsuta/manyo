class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)

    if user && user.authenticate(session_params[:password])
      log_in(user)
      redirect_to user, notice: 'ログインしました'
    else
      flash[:notice] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    log_out
    flash[:notice] = 'ログアウトしました'
    redirect_to login_path
  end

  private

  def session_params
    params.required(:session).permit(:email, :password)
  end

end

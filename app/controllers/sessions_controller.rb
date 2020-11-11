class SessionsController < ApplicationController
  skip_before_action :authenticate_user
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])#←password_digest？
      session[:user_id]=user.id
      redirect_to blogs_path(user.id), notice: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
      # flash.now[:danger] = 'ログインに失敗しました'
    end
  end
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end

end

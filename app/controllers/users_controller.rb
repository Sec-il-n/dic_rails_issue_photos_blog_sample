class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to blogs_path, notice:'ユーザー登録が完了しました。'#一覧画面へ
    else
      render :new, notice:'ユーザー登録が失敗しました。'
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  #   params.require(:user).permit(:name, :email, :password,
  #                                :password_confirmation)
  end
end

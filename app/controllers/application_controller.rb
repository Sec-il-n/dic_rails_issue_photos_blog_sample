class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  #エラーが出るので消している　↓undefined local variable or method `flash' for ApplicationController:Class
  # if @currentuser == nil
  #   flash[:notice]=t('notice.login_needed')
  #   redirect_to new_session_path
  # end
end

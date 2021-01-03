class ApplicationController < ActionController::Base
  # クロスサイトリクエストフォージュリへの対応策のコード
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :redirect_root

  private
  # ストロングパラメーター
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :self_introduction, :profile_image])
  end
  
  def redirect_root
    redirect_to root_path unless user_signed_in?
  end

end
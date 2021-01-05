class SessionsController < Devise::SessionsController

  # ゲストログイン
  def new_guest
    user = User.guest
    sign_in user
    redirect_to top_menu_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  protected

  def after_sign_in_path_for(resource)
    top_menu_path
  end
end

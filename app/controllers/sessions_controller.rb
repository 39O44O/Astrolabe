class SessionsController < Devise::SessionsController

  protected

  def after_sign_in_path_for(resource)
    top_menu_path
  end
end

class RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %i[destroy]

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def after_update_path_for(resource)
    user_path(current_user)
  end

  def after_sign_up_path_for(resource)
    top_menu_path
  end

  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to edit_user_registration_path, alert: 'ゲストユーザーは削除できません。'
    end
  end

end
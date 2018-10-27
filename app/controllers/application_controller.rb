class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def after_sign_in_path_for(user)
    user.admin? ? backend_root_path : root_path
  end
  
  def after_sign_out_path_for(user)
    new_user_session_path
  end

  private

end

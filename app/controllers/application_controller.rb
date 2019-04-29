class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_user.role_id == 1
      admin_root_path
    else
      root_path
    end
  end
end

class ApplicationController < ActionController::Base

  def after_sign_in_path_for(users)
    users_path
  end

end

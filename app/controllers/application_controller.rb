class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

end

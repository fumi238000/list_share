class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = %i[email name password password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  # TODO: 確認する
  # ログイン後のリダイレクト先
  def after_sign_in_path_for(_resource)
    tasks_path
  end

  # ログインしているか確認
  def login_check
    redirect_back(fallback_location: root_path) and return unless user_signed_in?
    # flash[:alert] = 'ログインしてください'
  end

  # リダイレクトするメソッド
  def redirect_root
    redirect_back(fallback_location: root_path) and return
  end
end

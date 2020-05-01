class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
# ログインログアウト後のリダイレクト先
  def after_sign_in_path_for(resource)
    tweets_path
  end
  
  def after_sign_out_path_for(resource)
    tweets_path
  end
end

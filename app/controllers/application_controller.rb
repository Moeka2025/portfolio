class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # 新規登録時
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    # ログイン時
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

end

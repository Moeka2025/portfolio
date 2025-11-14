class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_update_path_for(resource)
    flash[:notice] = "プロフィールを更新しました"
    mypage_path
  end

  protected

  def configure_permitted_parameters
    # 新規登録時
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :avatar])
    # ログイン時
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :avatar])
  end

end

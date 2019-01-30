class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

    def configure_permitted_parameters
      # sign_upのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :team])
      # account_updateのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :team])
    end

end

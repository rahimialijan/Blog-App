class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :sign_up_allawed_parameters, if: :devise_controller?

  protected

  def sign_up_allawed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :posts_counter)
    end
  end
end

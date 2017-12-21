class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_cart

#adicionado seguindo o howto na wiki do deviser sobre username/email
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_current_cart 
    session[:current_cart] ||= Cart.create.id
    @cart = Cart.find(session[:current_cart])
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :admin, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end

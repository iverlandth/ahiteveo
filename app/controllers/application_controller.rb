class ApplicationController < ActionController::Base


  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => ":( Upps un error, lo arreglaremos lo mas antes posible  !!!"
  end

  def current_userr
    @current_userr ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  private
  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end


  helper_method :current_user

end

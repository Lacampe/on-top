class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :session_conversations
  include PublicActivity::StoreController

  def after_sign_in_path_for(resource)
      request.env['omniauth.origin'] || stored_location_for(resource) || user_path(current_user)
  end

  def session_conversations
    session[:conversations] ||= []

    @users = current_user.friendlist
    @conversations = Conversation.includes(:recipient, :messages).find(session[:conversations])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :city, :profile_picture])
  end

end

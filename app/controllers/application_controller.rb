class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_filter :verify_authorized, except: :index, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order

  def after_sign_in_path_for(resource)
    edit_user_registration_path
  end

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['HAR_CONSUMER_KEY']
      config.consumer_secret = ENV['HAR_CONSUMER_SECRET']
      config.access_token = ENV['HAR_ACCESS_TOKEN']
      config.access_token_secret = ENV['HAR_ACCESS_SECRET']
    end
  end

  def current_order
    if current_user.orders.where(order_status_id: 1).exists?
      current_user.orders.where(order_status_id: 1).first
    else
      current_user.orders.new
    end
  end

  protected

    def user_not_authorized
      flash[:warning] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

end

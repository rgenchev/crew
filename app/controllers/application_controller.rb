class ApplicationController < ActionController::Base
  include Pundit

  helper_method :current_user

  before_action :authenticate
  before_action :set_crumbs

  after_action :verify_authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def authenticate
    redirect_to login_path if current_user.nil?
  end

  def set_crumbs
    add_breadcrumb "Home", root_url
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def record_not_found
    render file: 'public/404.html', status: :not_found, layout: false
  end
end

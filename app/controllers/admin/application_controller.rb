class Admin::ApplicationController < ApplicationController
  before_action :authorize_admins

  private
    def authorize_admins
      redirect_to root_path and return unless current_user.admin?
    end
end

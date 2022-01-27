class Admin::ApplicationController < ApplicationController
  before_action :authorize_admins
  before_action :set_admin_breadcrumb
  skip_before_action :set_crumbs

  private
    def authorize_admins
      redirect_to root_path and return unless current_user.admin?
    end

    def set_admin_breadcrumb
      add_breadcrumb "Admin", admin_dashboard_url
    end
end

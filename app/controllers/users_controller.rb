class UsersController < ApplicationController
  before_action :set_index_crumbs

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(username: params[:username])

    add_breadcrumb @user.username, user_url(@user)
  end

  private

  def set_index_crumbs
    add_breadcrumb "Teammates", users_url
  end
end

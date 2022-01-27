class Admin::UsersController < Admin::ApplicationController
  before_action :set_index_crumbs, only: [:index, :new]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    add_breadcrumb "New", new_admin_user_url
  end

  def create
    @user = User.new(user_params)
    @user.password = SecureRandom.alphanumeric(30)

    if @user.save
      redirect_to admin_users_url, flash: { success: "You've successfully created a new teammate account." }
    else
      redirect_to admin_users_url, flash: { error: "An error occurred while creating a teammate account: #{@user.errors.full_messages.to_sentence}." }      
    end
  end

  private

  def set_index_crumbs
    add_breadcrumb "Users", admin_users_url
  end

  def user_params
    params.require(:user).permit(
      :email,
      :username,
      :name,
      :role,
      :team_id
    )    
  end
end

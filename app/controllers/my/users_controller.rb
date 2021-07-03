class My::UsersController < ApplicationController
  def edit
    authorize current_user, policy_class: My::UserPolicy

    add_breadcrumb "Edit Account", my_account_url
  end

  def update
    authorize current_user, policy_class: My::UserPolicy

    if current_user.update(user_params)
      redirect_to my_account_url, flash: { success: "You've successfully updated your account." }
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :team_id
    )
  end
end

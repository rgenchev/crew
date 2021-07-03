class My::Users::ChangePasswordController < ApplicationController
  def update
    authorize current_user, policy_class: My::UserPolicy

    if current_user.authenticate(user_change_password_params[:old_password])
      current_user.password = user_change_password_params[:new_password]
      current_user.password_confirmation = user_change_password_params[:new_password_confirmation]

      if user_change_password_params[:new_password].blank? || user_change_password_params[:new_password_confirmation].blank?
        redirect_to my_account_url, flash: { error: "New password and new password confirmation cannot be empty." } and return
      end

      if current_user.save
        redirect_to my_account_url, flash: { success: "Password was successfully changed." }
      else
        redirect_to my_account_url, flash: { error: "New password and new password confirmation do no match." }
      end
    else
      redirect_to my_account_url, flash: { error: "Old password does not match the current password." }
    end
  end

  private
    def user_change_password_params
      params.require(:user).permit(
        :old_password,
        :new_password,
        :new_password_confirmation
      )
    end
end

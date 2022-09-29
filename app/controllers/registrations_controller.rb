class RegistrationsController < Devise::RegistrationsController
  private

  # def signup_params
  #   params.require(:user).permit( :name,
  #                                 :email,
  #                                 :password,
  #                                 :password_confirmation)
  # end

  # def account_update_params
  #   params.require(:user).permit( :name,
  #                                 :email,
  #                                 :password,
  #                                 :password_confirmation)
  # end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end

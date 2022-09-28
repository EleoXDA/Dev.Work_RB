class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(sign_up_params)
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end
end

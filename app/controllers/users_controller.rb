class UsersController < ApplicationController
  load_and_authorize_resource only: [:index, :show, :edit, :update]

  def show
    @linkedin = @user.auth_providers.where(ap_name: "linkedin").first
  end

  def update
    if @user.update(user_params)
      redirect_to(@user)
    else
      render "edit"
    end
  end

  def user_params
    params.require(:user).permit(:email, :admin)
  end
end
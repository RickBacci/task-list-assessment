class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if password_confirmed && @user.save
      flash[:success] = "Welcome to Task Manager! Thanks for joining!"
      session[:user_id] = @user.id

      redirect_to root_path
    else
      flash[:failure] = "There was a problem creating your account."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def password_confirmed
    params[:user][:password] == params[:user][:confirmation]
  end
end


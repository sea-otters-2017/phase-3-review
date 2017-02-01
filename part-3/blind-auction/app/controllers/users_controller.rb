class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user_id
        render :index
      else
        render :'/users/new'
      end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password_digest, :encrypted_password, :salt)
  end

end

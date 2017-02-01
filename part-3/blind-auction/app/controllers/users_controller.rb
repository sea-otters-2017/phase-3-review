class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)
    p user_params
    @user.password = user_params[:password_digest]
    p @user
      if @user.save!
        session[:user_id] = @user.id
        render :index
      else
        render :new
      end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password_digest, :encrypted_password)
  end

end

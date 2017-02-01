class UserController < ApplicationController
  def new
    @user  = User.new
    render new_user_path
  end

  def create
    user = params[:user]
    @user = User.new(username: user[:username], email: user[:email], password: user[:password])
    @user.save
    redirect_to root_path
  end
end

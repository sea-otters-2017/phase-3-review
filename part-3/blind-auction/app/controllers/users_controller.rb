class UsersController < ApplicationController
  def new
    @user = User.new
    render '/users/new'
  end

  def show
    @user = User.find()
  end

  def create
    @user = User.new(params)
      if @user.save
        session[:user_id] = @user_id
        render :index
      else
        render :'/users/new'
      end
  end

end

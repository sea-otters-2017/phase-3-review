class UsersController < ApplicationController
  def new
    @user = User.new
    render '/users/new'
  end

  def create
    @user = User.new(params)
      if @user.save
        session[:user_id] = @user_id
        erb :index
      else
        erb :'/users/new'
      end
  end

end

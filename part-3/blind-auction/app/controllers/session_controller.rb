class SessionController < ApplicationController

  def new
    @session = Session.new
    render :login
  end

  def create
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect "/users/index"
    else
      render :login
    end
  end

  def delete
    session.destroy
    redirect '/'
  end


end

class LoginsController < ApplicationController
  def new
    render :login
  end

  def create
    p params
    p @user = User.find_by(email: params[:login][:email])
    p params[:login][:password_digest]
    if @user && @user.authenticate(params[:login][:password])
      session[:current_user_id] = @user.id
      redirect user_path(@user.id)
    end
  end

  def delete
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
  end


end

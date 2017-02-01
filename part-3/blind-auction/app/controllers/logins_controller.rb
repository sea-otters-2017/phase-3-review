class LoginsController < ApplicationController
  def new
    render :login
  end

  def create
   @user = User.find_by(email: params[:login][:email])
    p params
    if @user && @user.authenticate(params[:login][:password])
      session[:current_user_id] = @user.id
      #It does find the thing right but it doesn't redirect like it should
      #goal is to redirect to the show page where it welcomes by name
      redirect_to user_path(@user.id)
    else
      redirect_to new_login_path
    end
  end

  def delete
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
  end


end

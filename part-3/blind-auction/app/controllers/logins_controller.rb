class LoginsController < ApplicationController
  def new
    render :login
  end

  def create
    if @user = User.authenticate(params[:username], params[:password])
      session[:current_user_id] = @user.id
      redirect '/users/'+@user.id+'/show'
    end
  end

  def delete
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
  end


end

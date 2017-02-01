class SessionsController < ApplicationController
  def new
  end

  def create
    p "-------------------------------------------------------"
    p params
    p "-------------------------------------------------------"
    # User.authenticate(params[:username], params[:password])
    # @user =
    render '/sessions/new'
  end
end

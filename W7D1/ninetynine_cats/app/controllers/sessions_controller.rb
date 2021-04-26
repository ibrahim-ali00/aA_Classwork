class SessionsController < ApplicationController
  before_action :require_logout, only: [:new, :create]
  before_action :require_login, only: [:destroy]


  def new
    render :new
  end

  def create
    @user = User.find_by_credential(params[:user][:username], params[:user][:password])
    if @user
      login_user!(user)
      redirect_to cats_url
    else
      # flash.errors
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end

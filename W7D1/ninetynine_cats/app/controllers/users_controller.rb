class UsersController < ApplicationController
  before_action :require_logout, only: [:new, :create]
  before_action :require_login, only: [:index, :show]


  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(username: params[:username], password: params[:password])
    
    if @user.save
      login_user!(@user)
      redirect_to cats_url
    else
      render :new
    end
  end

end

class UsersController < ApplicationController
  before_action :require_logout

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(username: username, password: password)

    if @user.save
      login(@user)
      redirect_to cats_url
    else
      render :new
    end
  end

end

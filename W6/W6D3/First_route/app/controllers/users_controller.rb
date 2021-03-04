class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
        # render plain: "Hello World!"
    end
    # User.find_by(id: params[:id])
    
    def create
        user = User.new(params.require(:user).permit(:username))
        user.save!
        render json: user
    end

    def show
        render json: params
    end

    
end

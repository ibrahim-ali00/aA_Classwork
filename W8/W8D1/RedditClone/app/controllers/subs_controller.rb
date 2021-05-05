class SubsController < ApplicationController
  def show
    @sub = Sub.find_by(id: params[:id])
    @moderator = User.find_by(id: @sub.moderator_id)
    render :show
  end

  def index
    @subs = Sub.all
    render :index
  end

  def new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = params[:user_id]
    if @sub.save
      redirect_to sub_path(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub
      if @sub.moderator_id == current_user.id && @sub.update(sub_params)
        redirect_to sub_path(@sub)
      else
        flash[:errors] = ["Something went wrong"]
        render :edit
      end
    end
  end
  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end

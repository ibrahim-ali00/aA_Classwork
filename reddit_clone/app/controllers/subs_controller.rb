class SubsController < ApplicationController
  def new
    @sub = Sub.new
    render :new
  end

  def create
    # @sub = Subs.new(sub_params)
    # @sub.moderator_id = current_user.id
    @sub = current_user.subs.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find_by(params[:id])
  end
  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end

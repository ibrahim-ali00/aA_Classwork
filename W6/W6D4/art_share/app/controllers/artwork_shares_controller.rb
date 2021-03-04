class ArtworkSharesController < ApplicationController
  def index
    shares = ArtworkShare.all
    render json: shares
  end

  def create
    share = ArtworkShare.new(share_params)
    if share.save
      render json: share
    else
      render json: share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    share = ArtworkShare.find_by(id: params[:id])
    render json: share
  end

  def update
    share = ArtworkShare.find_by(id: params[:id])
    if share.update(share_params)
      render json: share
    else
      render json: share.errors.full_messages, status: 422
    end
  end

  def destroy
    share = ArtworkShare.find_by(id: params[:id])
    share.destroy
    render json: share
  end

  private

  def share_params
    params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
  end
end

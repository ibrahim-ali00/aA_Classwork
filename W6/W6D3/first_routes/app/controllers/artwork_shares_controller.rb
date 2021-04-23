class ArtworkSharesController < ApplicationController
    def create
        shares = ArtworkShare.new(shares_params)
        # replace the `shares_attributes_here` with the actual attribute keys
        if shares.save!
          render json: shares
        else
          render json: shares.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        shares = ArtworkShare.find_by(id: params[:id])
        render json: shares

    end

    def destroy
        shares = ArtworkShare.find_by(id: params[:id])
        shares.destroy
        render json: shares
    end

    private

    def shares_params
        params.require(:shares).permit(:artwork_id, :viewer_id)
    end


end
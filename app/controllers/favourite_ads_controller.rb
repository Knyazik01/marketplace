class FavouriteAdsController < ApplicationController
  before_action :set_favourite_ad, only: %i[ show update destroy ]
  # INFO: favourite_ads cannot be edit

  # GET /favourite_ads
  def index
    @favourite_ads = FavouriteAd.all

    render json: @favourite_ads
  end

  # GET /favourite_ads/1
  def show
    render json: @favourite_ad
  end

  # POST /favourite_ads
  def create
    @favourite_ad = FavouriteAd.new(favourite_ad_params)

    if @favourite_ad.save
      render json: @favourite_ad, status: :created, location: @favourite_ad
    else
      render json: @favourite_ad.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favourite_ads/1
  def destroy
    @favourite_ad.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite_ad
      @favourite_ad = FavouriteAd.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favourite_ad_params
      params.require(:favourite_ad).permit(:user_id, :ad_id)
    end
end

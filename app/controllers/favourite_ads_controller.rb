class FavouriteAdsController < ApplicationController
  before_action :set_favourite_ad, only: %i[ show destroy ]
  before_action :check_favorite_ad_owner, only: [:show, :destroy]

  # GET /favourite_ads
  def index
    @favourite_ads = FavouriteAd.where(user_id: @user.id)
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
      render json: @favourite_ad, status: :created
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
    params.require(:favourite_ad).permit(:ad_id)
    # add auth user id in params
          .merge(user_id: @user.id)
  end

  def check_favorite_ad_owner
    if @user&.id != @favourite_ad.user_id
      render json: { error: "You aren't owner of this favorite ad" }, status: :forbidden
    end
  end
end

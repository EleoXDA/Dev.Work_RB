class OffersController < ApplicationController
  def index
    @user_offers = Offer.where(user: current_user)
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    @offer.challenge = @challenge
    if @offer.save
      redirect_to challenge_path(@challenge), notice: "Offer has been made..."
    else
      render 'challenges/show', status: :unprocessable_entity, locals: {'@offers': @challenge.offers}
    end
  end

  # def comment
  #   @offer = offer.find(params[:id])
  #   @challenge = Challenge.find(params[:challenge_id])
  # end

  private

  def offer_params
    params.require(:offer).permit(:date, :price)
  end
end

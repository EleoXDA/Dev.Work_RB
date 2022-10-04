class OffersController < ApplicationController
  def index
    @offers = policy_scope(Offer)
    @user_offers = Offer.where(user: current_user)
  end

  def show
    # @challenge = Challenge.find(params[:id])
    @offer = Offer.where(user: current_user).where(challenge: @challenge)
    authorize @offer
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    @offer.challenge = @challenge
    authorize @offer
    if @offer.save
      redirect_to challenge_path(@challenge), notice: "Offer has been made..."
    else
      render 'challenges/show', status: :unprocessable_entity, locals: { '@offers': @challenge.offers }
    end
  end
  # def comment
  #   @offer = offer.find(params[:id])
  #   @challenge = Challenge.find(params[:challenge_id])
  # end

  def edit
    authorize @offer
  end

  def update
    authorize @offer
    @offer.update(offer_params)
    redirect_to offers_path(@offers)
  end

  def destroy
    authorize @offer
    @offer.destroy
    redirect_to challenges_path(@challenges), status: :see_other
  end

  private

  def offer_params
    params.require(:offer).permit(:date, :price)
  end
end

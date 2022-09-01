class ChallengesController < ApplicationController
  include ActionView::Helpers::UrlHelper

  def show
    @challenge = Challenge.find(params[:id])
    @bookings = @challenge.bookings
    @booking = Booking.new
  end

  def index
    if params[:filter]
      @challenges = @challenges.where('filter ILIKE ?', "%#{params[:filter]}%")
    elsif current_page?(owner_challenges_path)
      @challenges = current_user.challenges
    else
      @challenges = Challenge.all
    end
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
    @challenge.filter = Filter.find(params[:challenge][:filter_id])
    if @challenge.save
      redirect_to challenges_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  #   @challenge = Challenge.find(params[:id])
  #   @challenge.destroy
  # end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :content, :price_max, :deadline)
  end
end

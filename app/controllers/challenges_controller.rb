class ChallengesController < ApplicationController
  include ActionView::Helpers::UrlHelper

  def show
    @challenge = Challenge.find(params[:id])
    @bookings = @challenge.bookings
    @booking = Booking.new
  end

  def index
    @filters = Filter.all
    if params[:filter]
      @filter = Filter.find_by(name: params[:filter])
      @challenges = Challenge.where('filter_id = ?', @filter.id)
    elsif current_page?(my_challenges_path)
      @challenges = current_user.challenges
    elsif !@filter.present?
      @challenges = Challenge.all
    else
      @challenges = Challenge.all
    end

    @markers = @challenges.geocoded.map do |challenge|
      {
        lat: challenge.latitude,
        lng: challenge.longitude
      }
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

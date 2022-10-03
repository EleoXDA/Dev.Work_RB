class ChallengesController < ApplicationController
  include ActionView::Helpers::UrlHelper

  before_action :set_challenge, only: %i[show edit update destroy]

  def show
    authorize @challenge
    @offers = @challenge.offers
    @offer = Offer.new
  end

  def index
    @challenges = policy_scope(Challenge)
    @filters = Filter.all
    if params[:filter].present? && params[:query].present? && params[:location].present?
      @filter = Filter.find_by(name: params[:filter])
      @challenges = Challenge.where('filter_id = ?', @filter.id).where("title ILIKE ?", "%#{params[:query]}%").where(location: params[:location])
    elsif params[:query].present? && params[:location].present?
      @challenges = Challenge.where("title ILIKE ?", "%#{params[:query]}%").where(location: params[:location])
    elsif params[:filter].present? && params[:location].present?
      @filter = Filter.find_by(name: params[:filter])
      @challenges = Challenge.where('filter_id = ?', @filter.id).where(location: params[:location])
    elsif params[:filter].present? && params[:query].present?
      @filter = Filter.find_by(name: params[:filter])
      @challenges = Challenge.where('filter_id = ?', @filter.id).where("title ILIKE ?", "%#{params[:query]}%")
    elsif params[:query].present?
      @challenges = Challenge.where("title ILIKE ?", "%#{params[:query]}%")
    elsif params[:location].present?
      @challenges = Challenge.where(location: params[:location])
    elsif params[:filter].present?
      @filter = Filter.find_by(name: params[:filter])
      @challenges = Challenge.where('filter_id = ?', @filter.id)
    elsif current_page?(my_challenges_path)
      @challenges = current_user.challenges
    else
      @challenges = Challenge.all
    end

    locations = Challenge.distinct.pluck(:location)
    @location_filters = []
    locations.each do |location|
      if !location.nil?
        @location_filters << location
      end
    end

    @markers = @challenges.geocoded.map do |challenge|
      {
        lat: challenge.latitude,
        lng: challenge.longitude,
        info_window: render_to_string(partial: "info_window", locals: {challenge: challenge})
      }
    end
  end

  def new
    @challenge = Challenge.new
    authorize @challenge
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
    @challenge.filter = Filter.find(params[:challenge][:filter_id])
    authorize @challenge
    if @challenge.save
      redirect_to challenge_path(@challenge)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @challenge
    @challenge.destroy
    redirect_to challenges_path(@challenges), status: :see_other
  end

  def edit
    authorize @challenge
  end

  def update
    authorize @challenge
    @challenge.update(challenge_params)
    redirect_to challenge_path(@challenge)
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:title, :content, :price_max, :deadline, :location, photos: [])
  end
end

class ChallengesController < ApplicationController
  def show
    @challenge = Challenge.find(params[:id])
  end

  def index
    @challenges = Challenge.all
  end

  # def new
  #   @challenge = Challenge.new
  # end

  # def create
  #   @challenge = Challenge.new(challenge_params)
  #   if @challenge.save
  #     redirect_to challenges_path
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @challenge = Challenge.find(params[:id])
  #   @challenge.destroy
  # end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :content, :price_max, :deadline)
  end
end

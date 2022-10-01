class ChatroomsController < ApplicationController
  def show
    @chatroom = Challenge.find(params[:id])
    @comment = Comment.new
  end
end

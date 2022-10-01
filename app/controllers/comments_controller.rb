class CommentsController < ApplicationController
  def show
    @chatroom = Challenge.find(params[:id])
    @comment = Comment.new
  end

  def create
    @chatroom = Challenge.find(params[:challenge_id])
    @comment = Comment.new(comment_params)
    @comment.chatroom = @chatroom
    @comment.user = current_user
    if @comment.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "comment", locals: { comment: @comment })
      )
      head :ok
    else
      render "challenges/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

class AddCommentsToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :chatroom, foreign_key: true
  end
end

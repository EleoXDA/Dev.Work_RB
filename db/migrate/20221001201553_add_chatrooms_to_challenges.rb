class AddChatroomsToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :challenge, foreign_key: true
  end
end

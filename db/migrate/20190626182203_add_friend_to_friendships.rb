class AddFriendToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_column :friendships, :friend_id, :bigint
  end
end

class AddFollowerAndFolloweeToRelationships < ActiveRecord::Migration[7.0]
  def change
    change_column :relationships, :follower_id, :bigint, null: false, foreign_key: {to_table: :users}
    change_column :relationships, :followee_id, :bigint, null: false, foreign_key: {to_table: :users}
  end
end


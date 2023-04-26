class AddNotNullConstraintToFollowerIdInRelationships < ActiveRecord::Migration[7.0]
  def change
    change_column_null :relationships, :follower_id, false
  end
end

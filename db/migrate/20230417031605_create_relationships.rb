class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.references :follower, null: false, foreign_key: { to_table: :users}
      t.references :followee, null: false, foreign_key:  { to_table: :users}

      t.timestamps
    end
    add_index :relationships, [:follower_id, :followee_id], unique: true
  end
  def up
    change_column :relationships, :follower_id, :integer, null: false
    change_column :relationships, :followee_id, :integer, null: false
  end
  
  def down
    change_column :relationships, :follower_id, :integer, null: true
    change_column :relationships, :followee_id, :integer, null: true
  end
end

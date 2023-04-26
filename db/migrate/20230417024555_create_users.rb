class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :users, :id, unique: true
    change_column_null :users, :name, true #name can be null
  end
end

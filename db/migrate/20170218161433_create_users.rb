class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :user_id, :null => false
      t.string :email, :null => false
      t.string :password_digest, :null => false
      t.string :room_ids
      t.string :friend_ids

      t.timestamps null: false
    end
  end
end

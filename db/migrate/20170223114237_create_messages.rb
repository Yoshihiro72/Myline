class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :room_id,   null: false
      t.integer :sender_id, null: false
      t.string  :text,      null: false

      t.timestamps
    end
  end
end

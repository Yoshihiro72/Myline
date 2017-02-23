class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string  :name
      t.string  :members,       null: false, default: "[]"
      t.integer :member_count,  null: false
      t.string  :messages,                   default: "[]"
      t.integer :message_count, null: false, default: 0

      t.timestamps
    end
  end
end

class AddColumnUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :talking_with, :string, :null => false, :default => "[]", :after => :friends
  end
end

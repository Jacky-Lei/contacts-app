class ChangeUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email, :name
    add_column :users, :username, :string, unique: true, null: false
  end
end

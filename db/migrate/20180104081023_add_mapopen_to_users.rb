class AddMapopenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :state, :boolean
  end
end

class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|

      t.references :user, index: true, foreign_key: true
      t.integer :follower

      t.timestamps null: false
    end
  end
end

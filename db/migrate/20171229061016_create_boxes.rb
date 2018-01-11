class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :img
      t.decimal :lon
      t.decimal :lat
      t.string :placeName
      t.string :typee
      t.text :memo

      t.timestamps null: false
    end
  end
end


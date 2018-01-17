class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.references :user, index: true, foreign_key: true
      t.string :img
      t.decimal :lon
      t.decimal :lat
      t.string :placeName
      t.string :address
      t.string :classification
      t.text :content

      t.timestamps null: false
    end
  end
end

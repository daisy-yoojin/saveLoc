class CreateNoticeReplies < ActiveRecord::Migration
  def change
    create_table :notice_replies do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.belongs_to :notice, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end

class Notice < ActiveRecord::Base
  has_many :notice_replies, dependent: :destroy
  belongs_to :user
end

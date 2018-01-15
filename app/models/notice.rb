class Notice < ActiveRecord::Base
  # Association
  has_many :notice_replies, dependent: :destroy
  belongs_to :user

  # Validation
  validates :title, presence: true
  validates :content, presence: true
end

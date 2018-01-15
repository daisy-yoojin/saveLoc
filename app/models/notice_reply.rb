class NoticeReply < ActiveRecord::Base
  # Association
  belongs_to :notice
  belongs_to :user

  # Validation
  validates :content, presence: true
end

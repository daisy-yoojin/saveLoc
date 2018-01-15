class PostReply < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  # Validation
  validates :content, presence: true
end

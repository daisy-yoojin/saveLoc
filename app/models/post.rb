class Post < ActiveRecord::Base
  resourcify
  include Authority::Abilities
  
  # Association
  has_many :post_replies, dependent: :destroy
  belongs_to :user
  
  # Validation
  validates :title, presence: true
  validates :content, presence: true
  
end

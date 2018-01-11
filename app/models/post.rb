class Post < ActiveRecord::Base
  resourcify
  include Authority::Abilities
  
  has_many :post_replies, dependent: :destroy
  belongs_to :user
end

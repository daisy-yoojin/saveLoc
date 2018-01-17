class User < ActiveRecord::Base
  rolify
  has_many :markers, dependent: :destroy
  has_many :post_replies, dependent: :destroy
  has_many :notice_replies, dependent: :destroy
  has_many :follower, dependent: :destroy
  has_many :services, dependent: :destroy
  include Authority::UserAbilities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :posts, dependent: :destroy

  after_create :set_default_role, if: Proc.new { User.count > 2 }

  private

  def set_default_role
    add_role :user
  end

  

end

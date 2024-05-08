class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
#@user.followingsとすることでそのユーザーがフォローしている人の一覧を表示することができる
# 自分がフォローしてる(followed)人のID(follower_id)を取ってくる
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
 #@user.followingsとすることでそのユーザーがフォローしている人の一覧を表示することができる
 
  validates :name, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }


  def get_profile_image
    (profile_image.attached?)? profile_image : 'default-image-0.jpg'
  end

  def follow(user)
    active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      User.where("name LIKE?","%#{word}")
    else search == "partial_match"
      User.where("name LIKE?","%#{word}%")
    end
  end
  
  GUEST_USER_EMAIL = "guest@example.com"
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
  def guest_user?
    email == GUEST_USER_EMAIL
  end
end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
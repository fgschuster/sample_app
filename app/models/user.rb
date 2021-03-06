class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships,  foreign_key:  "followed_id",
                                    class_name:   "Relationship",
                                    dependent:    :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  before_save { email.downcase! }
  #before_save { self.email = email.downcase }
  before_create { create_token(:remember_token) }

  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    # This is preliminary.  See "Following users" for the full implementation
    # Micropost.where("user_id = ?", id)  # ? prevents SQL injection
    # Updated to show own and followed users' microposts
    Micropost.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  private

    def create_token(column)
      begin
        self[column] = User.hash(User.new_token)
      end while User.exists?(column => self[column])
    end
end

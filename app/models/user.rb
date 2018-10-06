class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :friendships, class_name: "Friendship", foreign_key: 'sender_id'
  has_many  :friends, through: :friendships, source: 'receiver'
  has_many  :friend_requests, class_name: "FriendRequest", foreign_key: 'request_sender'
  has_many  :requests_received, class_name: "FriendRequest", foreign_key: 'request_receiver'

  def feed
    Post.where("user_id = ?", id)
  end
end

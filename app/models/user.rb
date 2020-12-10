class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :user_libraries, dependent: :destroy
  has_many :discs, through: :user_libraries

  has_many :deals_sender, class_name: 'Deal', foreign_key: 'sender_id'
  has_many :deals_receiver, class_name: 'Deal', foreign_key: 'receiver_id'

  has_many :pm_authors, class_name: 'DealPm', foreign_key: 'pm_author_id'

  has_many :articles
  has_many :playlists, dependent: :destroy

  has_many :comments_receiver, class_name: 'Comment', foreign_key: 'comment_receiver_id', dependent: :destroy
  has_many :comments_sender, class_name: 'Comment', foreign_key: 'comment_sender_id'

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  validates_confirmation_of :password

  validates :email, presence: true

  has_one_attached :avatar

  # Call after creation to send an email
  after_create :send_welcome_email
  def send_welcome_email
    UserMailer.send_message_new_user(self).deliver #optionnal => 'deliver_now'
  end
end

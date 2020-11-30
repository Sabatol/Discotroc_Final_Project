class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :user_libraries
  has_many :discs, through: :user_libraries  
  
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "Deal"
  has_many :received_messages, foreign_key: 'receiver_id', class_name: "Deal"
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 
  validates :first_name, presence: true, length: { in: 1..35 }

  validates :last_name, presence: true, length: { in: 1..35 }       
      
  validates :email, presence: true
  validates :address, presence: true, length: { in: 2..200 }
  validates :city, presence: true, length: { in: 2..140 }
  validates :country, presence: true, length: { in: 2..45 }
  validates :zipcode, presence: true
  validates :description, length: { in: 5..200 }
end

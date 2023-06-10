class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :payments, foreign_key: :author_id, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates_presence_of :email, :password
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates_length_of :password, minimum: 6, maximum: 20
end

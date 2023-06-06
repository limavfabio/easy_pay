class Group < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :payments
  validates_presence_of :name, :user_id, :icon
  validates_uniqueness_of :name
  validates_length_of :name, minimum: 3, maximum: 20
end

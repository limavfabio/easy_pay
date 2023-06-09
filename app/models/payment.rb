class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :groups

  validates_presence_of :name, :author_id
  validates :amount, presence: true, numericality: { greater_than: 0 }
end

class GroupPayment < ApplicationRecord
  belongs_to :group
  belongs_to :payment

  validates_presence_of :group_id, :payment_id
end

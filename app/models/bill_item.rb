class BillItem < ApplicationRecord
  validates :user, presence: true, length: {minimum: 5}
  validates :paid_amount, presence: true
  belongs_to :bill_list
end

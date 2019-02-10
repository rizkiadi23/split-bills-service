class BillList < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}
  has_many :bill_items, :dependent => :delete_all
end

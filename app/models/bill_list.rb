class BillList < ApplicationRecord
  has_many :bill_items, :dependent => :delete_all
end

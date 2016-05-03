class Order < ActiveRecord::Base
  belongs_to :account
  belongs_to :employee
  belongs_to :stock
  has_one :owns_stock
end

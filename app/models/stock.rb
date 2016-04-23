class Stock < ActiveRecord::Base
  has_many :owns_stocks
  has_many :clients, through: :owns_stocks
  has_many :orders
end

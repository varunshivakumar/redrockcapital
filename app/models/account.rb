class Account < ActiveRecord::Base
  belongs_to :client
  belongs_to :employee
  has_many :owns_stocks
end

class Employee < User
  has_many :accounts
  has_many :clients, through: :accounts
  has_many :orders
end

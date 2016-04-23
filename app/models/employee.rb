class Employee < User
  has_many :accounts
  has_many :clients, through: :accounts
end

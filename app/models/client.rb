class Client < User
  has_one :account
  has_one :employee, through: :account
end

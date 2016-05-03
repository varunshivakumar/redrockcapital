class Employee < User
  has_many :accounts
  has_many :clients, through: :accounts
  has_many :orders

  def self.search(search)
    if search
      self.where("first_name like ? OR email like ? OR last_name like ?","%#{search}%","%#{search}%","%#{search}%"  )
    else
      self.all
    end
  end
end

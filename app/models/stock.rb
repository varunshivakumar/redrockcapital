class Stock < ActiveRecord::Base
  has_many :owns_stocks
  has_many :clients, through: :owns_stocks
  has_many :orders

  def self.search(search)
    if search
      self.where('stock_symbol LIKE ? OR company_name like ?', "%#{search}%", "%#{search}%")
    else
      self.all
    end
  end
end

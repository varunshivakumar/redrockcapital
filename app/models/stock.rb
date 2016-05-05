class Stock < ActiveRecord::Base
  has_many :owns_stocks
  has_many :clients, through: :owns_stocks
  has_many :orders

  has_many :pps_points

  after_create :make_pps_point

  def make_pps_point
    PpsPoint.create(stock_id: self.id, price_per_share: self.price_per_share)
  end

  def self.search(search)
    if search
      self.where('stock_symbol LIKE ? OR company_name like ? OR stock_type like ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.all
    end
  end
end

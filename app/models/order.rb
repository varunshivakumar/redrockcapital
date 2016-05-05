class Order < ActiveRecord::Base
  belongs_to :account
  belongs_to :employee
  belongs_to :stock
  has_one :owns_stock

  attr_accessor :owns_stock

  after_create :make_pps_point

  def make_pps_point
    if self.order_type >= 3
      PpsPoint.create(order_id: self.id, price_per_share: self.price_per_share)
    end
  end

  has_many :pps_points
end

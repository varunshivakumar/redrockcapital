class PpsPoint < ActiveRecord::Base
  belongs_to :stock

  after_create :check_incomplete_orders

  def check_incomplete_orders
    stock = Stock.find(self.stock_id)
    orders = Order.where(completed: false, stock_id: self.stock_id)
    orders.each do |order|
      if order.price_per_share > stock.price_per_share
        owns_stock = OwnsStock.find(order.owns_stock_id)
        if order.num_shares >= owns_stock.num_shares
          order.update_attributes(completed: true)
          OwnsStock.destroy(owns_stock.id)
        else
          order.update_attributes(completed: true)
          owns_stock.update_attributes(num_shares: owns_stock.num_shares - order.num_shares)
        end
      end
      if order.order_type == 3
        new_order = Order.new
        dup_order = order.dup
        dup_order.id = new_order.id
        dup_order.price_per_share = stock.price_per_share - dup_order.trail
        dup_order.save
        order.update_attributes(completed: true)
      end
    end
  end
end

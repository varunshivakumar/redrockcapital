class ClientsController < ApplicationController

  def home
    # A customer's current stock holdings
    @stocks = OwnsStock.where(account_id: current_user.id)

    # Personalized stock suggestion list
    sorted_stocks = @stocks.sort! {|x, y| y.num_shares <=> x.num_shares}
    @personalized_stock_suggestions = sorted_stocks[0,4]

    # Send request to employee to order stock
    # Make an order request button
  end

  def orders
    # History of all current and past orders a customer has placed
    @orders = Order.where(account_id: current_user.id)

    # Send request to employee to order stock
    # Make an order request button
  end

end

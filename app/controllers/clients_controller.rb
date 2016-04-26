class ClientsController < ApplicationController

  def home
    # A customer's current stock holdings
    account = Account.where(client_id: current_user.id)
    @stocks = OwnsStock.where(account_id: account.first.id)

    # Personalized stock suggestion list
    sorted_stocks = @stocks.sort {|x, y| y.num_shares <=> x.num_shares}
    most_owned_stock = Stock.find(sorted_stocks.first.stock_id)
    @stk_suggestions = Stock.where(stock_type: most_owned_stock.stock_type)

    # Send request to employee to order stock
    # Make an order request button
  end

  def orders
    # History of all current and past orders a customer has placed
    account = Account.where(client_id: current_user.id)
    @orders = Order.where(account_id: account.first.id)

    # Send request to employee to order stock
    # Make an order request button
  end

end

class ClientsController < ApplicationController

  def show
    @client = Client.find(params[:id])

    # Client:(1)
    # A customer's current stock holdings
    @account = Account.where(client_id: @client.id)
    @stocks = OwnsStock.where(account_id: @account.first.id)

    # Client:(9)
    # Personalized stock suggestion list
    sorted_stocks = @stocks.sort {|x, y| y.num_shares <=> x.num_shares}
    most_owned_stock = Stock.find(sorted_stocks.first.stock_id)
    @stk_suggestions = Stock.where(stock_type: most_owned_stock.stock_type)

    # TODO: Send request to employee to order stock
    # TODO: Make an order request button

  end

  def orders
    @client = Client.find(params[:id])

    # Client:(5), Manager: (6)
    # History of all current and past orders a customer has placed
    # Produce a list of orders by stock symbol or customer name
    @account = Account.where(client_id: @client.id)
    @orders = Order.where(account_id: @account.first.id)

    # TODO: Send request to employee to order stock
    # TODO: Make an order request button
  end

end

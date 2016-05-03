class ClientsController < ApplicationController
  include Helper
  def show
    @client = Client.find(params[:id])

    # Client:(1)
    # A customer's current stock holdings
    @account = Account.where(client_id: @client.id)
    @owns_stocks = OwnsStock.where(account_id: @account.first.id)

    # Client:(9)
    # Personalized stock suggestion list
    @stk_suggestions = stock_suggestions_client(@client.id)

    # TODO: Send request to employee to order stock
    # TODO: Make an order request button
    # <!-- This it the link to make a new order -->
    # <%= link_to 'Buy or Sell Stock', orders_path(current_user) %>


  end

  def orders
    @client = Client.find(params[:id])

    # Client:(5), Manager: (6)
    # History of all current and past orders a customer has placed
    # Produce a list of orders by stock symbol or customer name
    @account = Account.where(client_id: @client.id)
    @orders = Order.where(account_id: @account.first.id)
    @active_orders = Order.where(account_id: @account.first.id, completed: false)
    @completed_orders = Order.where(account_id: @account.first.id, completed: true)

    # TODO: Send request to employee to order stock
    # TODO: Make an order request button
  end

end

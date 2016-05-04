class OrdersController < ApplicationController

  def new
    @order = Order.new
    @account = Account.find(params[:account_id].to_i)
    @client = Client.find(@account.client_id)
    @buy_sell_type = params[:buy_sell_type]
  end

  def create
    @order = Order.new(order_params)
    @order.stock_id = params[:stock_id].to_i
    # Preliminary info
    stock = Stock.find(@order.stock_id)
    price_per_share = stock.price_per_share
    num_shares = @order.num_shares
    # Get Price per share
    @order.price_per_share = price_per_share
    # Calculate transaction fee
    @order.transaction_fee = price_per_share * num_shares * 0.05
    # Determine employee
    @order.employee_id = @order.account.employee.id
    # Determine completion
    if @order.buy_sell_type == 0
      @order.completed = true
    end

    if @order.save
      # Create owns stock object
      @owns_stock = OwnsStock.create(
        num_shares: @order.num_shares,
        price_per_share: @order.price_per_share,
        account_id: @order.account.id,
        stock_id: @order.stock_id,
        order_id: @order.id
      )
      flash[:success] = "Succesful Order"
    else
      flash[:notice] = "Unsuccessful Order"
    end
    redirect_to controller: 'clients', action: 'show', id: @order.account.client.id

  end

  private

  def order_params
    params.require(:order).permit(:stock_id, :num_shares, :order_type, :buy_sell_type, :account_id)
  end
end
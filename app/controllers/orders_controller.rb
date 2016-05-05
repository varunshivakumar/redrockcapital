class OrdersController < ApplicationController
  include Helper

  def new
    @order = Order.new
    @account = Account.find(params[:account_id].to_i)
    @client = Client.find(@account.client_id)
    @buy_sell_type = params[:buy_sell_type]
    if @buy_sell_type == "sell"
      @owns_stock = OwnsStock.find(params[:owns_stock_id].to_i)
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.buy_sell_type == "buy"
      @order.stock_id = params[:stock_id].to_i
    end

    # Update all stock prices
    # update_stocks

    # Preliminary info
    stock = Stock.find(@order.stock_id)
    stock_quote = StockQuote::Stock.quote(stock.stock_symbol)
    price_per_share = stock.price_per_share
    num_shares = @order.num_shares

    # Determine employee
    @order.employee_id = @order.account.employee.id

    # Calculate transaction fee
    @order.transaction_fee = price_per_share * num_shares * 0.05

    # Determine completion and price per share
    @order.order_type = params[:order_type].to_i
    if @order.order_type == 0
      @order.price_per_share = price_per_share
      @order.completed = true
    elsif @order.order_type == 1
      @order.price_per_share = stock_quote.last_trade_price_only
      @order.completed = true
    end

    # Check incomplete orders

    if @order.save
      # Create owns stock object
      if @order.buy_sell_type == "buy"
        @owns_stock = OwnsStock.create(
            num_shares: @order.num_shares,
            price_per_share: @order.price_per_share,
            account_id: @order.account.id,
            stock_id: @order.stock_id,
            order_id: @order.id
        )
      elsif @order.completed
        owns_stock = OwnsStock.find(params[:order][:owns_stock_id].to_i)
        if num_shares == owns_stock.num_shares
          OwnsStock.destroy(owns_stock.id)
        else
          owns_stock.update_attributes(num_shares: owns_stock.num_shares - num_shares)
        end
      end
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

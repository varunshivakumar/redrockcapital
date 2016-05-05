class StocksController < ApplicationController
  include Helper
  helper_method :update_stocks
  def show
    @stock = Stock.where(stock_symbol: params[:name]).first

    # Client:(4)
    # Share price history of a given stock over a certain period of time
    @stock_quote = StockQuote::Stock.quote(@stock.stock_symbol)

    # USE THIS URL FOR DATA FIELDS
    # https://github.com/tyrauber/stock_quote

    # Manager:(6)
    # Produce a list of orders by stock symbol or by customer name
    @orders = Order.where(stock_id: @stock.id).order("created_at DESC")
  end

  def stocks
    # Manager:(4)
    # Produce a comprehensive listing of stocks
    @all_stocks = Stock.all

    # Manager:(1)
    # Set the share price of a stock(for simulating market fluctuations in a stock's share price)
    # TODO: Make an edit button for each of the stocks to edit the price - only if you're the manager

    # TODO: Add a button if you're manager that automatically updates the prices of all stocks realtime

    # Client:(6)
    # Stocks available of a particular type and most-recent order info
    # call 'stock_type_orders" to find most-recent order info for types of stocks !!!
    @stock_types = stock_types

    # Client:(7)
    # TODO: Stocks available w/ a particular keyword or set of keywords in the stock name (searchbar)
    # and most recent order info ? of those stocks, of each stock?
    @stocks = @all_stocks.search(params[:search]) if params[:search].present?
    if @stocks.nil?
      @stocks = Stock.all
    end

    # Client:(8)
    # Best-seller list of stocks
    @best_seller_stocks = best_seller_stocks

    # Manager:(9)
    # Produce a list of most actively traded stocks
    @most_actively_traded_stocks = most_actively_traded_stocks

  end

  def edit
    @stock = Stock.find(params[:name].to_i)
  end

  def update
    @stock = Stock.find(params[:name].to_i)
    if @stock.update_attributes(stock_params)
      flash[:success] = "Stock Updated"
      redirect_to :stocks
    else
      render 'root_path'
    end
  end

  def update_stock_prices
    if params[:ask] == "true"
      update_stocks_pps(true)
    else
      update_stocks_pps(false)
    end
    redirect_to :stocks
  end

  private

  def stock_params
    params.require(:stock).permit(:price_per_share)
  end
end

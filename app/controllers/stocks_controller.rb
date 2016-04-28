class StocksController < ApplicationController

  def show
    @stock = Stock.where(stock_symbol: params[:name]).first

    # Client:(4)
    # Share price history of a given stock over a certain period of time
    @stock_quote = StockQuote::Stock.quote(@stock.stock_symbol)

    # USE THIS URL FOR DATA FIELDS
    # https://github.com/tyrauber/stock_quote

    # Client:(4), Manager:(6)
    # Most recent orders of that stock
    # Produce a list of orders by stock symbol or by customer name - Make a see orders button
    @orders = Order.where(stock_id: @stock.id).order("created_at DESC")
  end

  def stocks
    @stocks = Stock.all

    # CLient:(6)
    # Stocks available of a particular type and most-recent order info
    @stock_types = Array.new
    for stock in @stocks
      unless @stock_types.include? stock.stock_type
        @stock_types.push(stock.stock_type)
      end
    end

    # Client:(7)
    # Stocks available w/ a particular keyword or set of keywords in the stock name (searchbar)
    # and most recent order info -> look at stocks#orders

    # Client:(8)
    # Best-seller list of stocks
    orders = Order.where(completed: true)
    stocks_traded = Array.new(orders.count)
    for order in orders
      id = order.stock_id
      if stocks_traded[id].nil?
        stocks_traded[id] = order.num_shares
      else
        stocks_traded[id] += order.num_shares
      end
    end
    stocks_traded.map do |st_tr|
      if st_tr.nil?
        st_tr = 0
      end
    end
    @best_seller_stocks = stocks_traded.sort {|x, y| y <=> x}

    byebug
  end
end

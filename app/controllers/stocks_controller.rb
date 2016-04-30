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
    # Produce a list of orders by stock symbol or by customer name
    # TODO: ?- Make a see orders button if you want a separate orders page
    @orders = Order.where(stock_id: @stock.id).order("created_at DESC")
  end

  def stocks
    # Manager:(4)
    # Produce a comprehensive listing of stocks
    @stocks = Stock.all

    # Manager:(1)
    # Set the share price of a stock(for simulating market fluctuations in a stock's share price)
    # TODO: Make an edit button for each of the stocks to edit the price - only if you're the manager

    # TODO: Add a button if you're manager that automatically updates the prices of all stocks realtime

    # Client:(6)
    # Stocks available of a particular type and most-recent order info
    # TODO: Create a method in model to find most-recent order info for types of stocks !!!
    @stock_types = Array.new
    for stock in @stocks
      unless @stock_types.include? stock.stock_type
        @stock_types.push(stock.stock_type)
      end
    end

    # Client:(7)
    # TODO: Stocks available w/ a particular keyword or set of keywords in the stock name (searchbar)
    # and most recent order info ? of those stocks, of each stock?

    # Client:(8)
    # Best-seller list of stocks
    orders = Order.where(completed: true, order_type: [0 ,1], buy_sell_type: "buy")
    stocks_traded = Array.new(Stock.count, 0)
    for order in orders
      id = order.stock_id
      if stocks_traded[id] == 0
        stocks_traded[id] = order.num_shares
      else
        stocks_traded[id] += order.num_shares
      end
    end
    @best_seller_stocks = stocks_traded.sort {|x, y| y <=> x}

    # Manager:(9)
    # Produce a list of most actively traded stocks
    orders = Order.where(completed: true)
    stocks_traded = Array.new(Stock.count, 0)
    for order in orders
      id = order.stock_id
      if stocks_traded[id] == 0
        stocks_traded[id] = order.num_shares
      else
        stocks_traded[id] += order.num_shares
      end
    end
    @most_actively_traded_stocks = stocks_traded.sort {|x, y| y <=> x}

  end
end

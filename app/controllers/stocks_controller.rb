class StocksController < ApplicationController

  def index

  end

  def show
    @stock = Stock.find_by(params[:id])
    # Share price history of a given stock over a certain period of time
    @stock_quote = StockQuote::Stock.quote(@stock.stock_symbol)
    # USE THIS URL FOR DATA FIELDS
    # https://github.com/tyrauber/stock_quote

    # Most recent orders of that stock
    @orders = Order.where(stock_id: @stock.id).order("created_at DESC")
  end

  def search
    # Stocks available of a particular type and most-recent order info (searchbar)
    # Stocks available w/ a particular keyword or set of keywords in the stock name and most recent order info
    @stocks = Stock.all

    # Best-seller list of stocks
    orders = Order.where(completed: true)
    stocks_traded = Array.new(orders.count)
    z = 0
    while z < orders.count
      id = orders[z].id
      if stocks_traded[id].nil?
        stocks_traded[id] = orders[z].num_shares
      else
        stocks_traded[id] += orders[z].num_shares
      end
      z += 1
    end
    tmpstocks = stocks_traded.select!{|x|!x.nil? }
    @best_seller_stocks = tmpstocks.sort {|x, y| y <=> x}
  end
end

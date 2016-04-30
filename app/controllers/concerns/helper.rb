module Helper
  # Stock suggestions for customer
  def stock_suggestions_client(client_id)
    account = Account.where(client_id: client_id)
    stocks = OwnsStock.where(account_id: account.first.id)
    sorted_stocks = stocks.sort {|x, y| y.num_shares <=> x.num_shares}
    most_owned_stock = Stock.find(sorted_stocks.first.stock_id)
    @stk_suggestions = Stock.where(stock_type: most_owned_stock.stock_type)
  end

  # Find all stock types
  def stock_types
    stock_types = Array.new
    for stock in Stock.all
      unless stock_types.include? stock.stock_type
        stock_types.push(stock.stock_type)
      end
    end
    stock_types
  end

  # Find orders of particular stock types
  def stock_type_orders(stock_type)
    stocks = Stock.where(stock_type: stock_type)
    stock_ids = stocks.map { |stock| stock.id }
    Order.where(stock_id: stock_ids)
  end

  # Best seller stocks
  def best_seller_stocks
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
    stocks_traded.sort {|x, y| y <=> x}
  end

  # Most actively traded stocks
  def most_actively_traded_stocks
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
    stocks_traded.sort {|x, y| y <=> x}
  end

  # Customer mailing lists
  def mailing_list_employee(employee_id)
    emails = Array.new
    clients = Client.where(is_employee: false)
    for client in clients
      if client.employee.id == employee_id
        emails.push(client.email)
      end
    end
    emails
  end

  # Stock revenue
  def stock_revenue(stock_symbol)
    stock_quote = StockQuote::Stock.quote(stock_symbol)
    stock = Stock.where(stock_symbol: stock_symbol).first
    stock.total_num_shares * stock_quote.change
  end

  # Stock type revenue
  def stock_type_revenue(stock_type)
    revenue = 0
    for stock in Stock.where(stock_type: stock_type)
      revenue += stock_revenue(stock.stock_symbol)
    end
    revenue
  end

  # Client Revenue
  def client_revenue(client_id)
    client = Client.find(client_id)
    buy_orders = Order.where(client_id: client_id, buy_sell_type: "buy")
    sell_orders = Order.where(client_id: client_id, buy_sell_type: "sell")

    spent = 0




  end
end
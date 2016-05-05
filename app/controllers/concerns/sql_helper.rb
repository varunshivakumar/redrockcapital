# Get all the stocks
def get_all_stocks
  # SELECT * FROM stocks;
end
# Get all the users
def get_all_users
  # SELECT * FROM users;
end
# Set the share price of a stock
def set_share_price(newPrice, companyName)
  # UPDATE stock SET PricePerShare  = $NewPrice WHERE CompanyName=$CompanyName;
end
# Add, edit, and delete information for an employee
def add_employee_info(newField)
  # SELECT * FROM employee;
  # UPDATE SET $newField =  $newFieldValue WHERE EMPLOYEEID= $empID;
end
# Edit employee information
def edit_employee_info
  # UPDATE employee SET $info_type = $new_info WHERE EMPLOYEEID = $empID;
end
# Delete an employee
def delete_employee_info
  # UPDATE employee SET $field = NULL WHERE EMPLOYEEID=$empID;
end

# Produce a list of orders by stock symbol
def order_list
  # SELECT * FROM orders WHERE stockSymbol=$stockSymbol;
end

# Produce a summary listing of revenue generated by a particular stock, stock type, or customer
def revenue_listing
  # SELECT* FROM orders WHERE stockSymbol = $stockSymbol;
end

# Determine which customer rep generated most total rev
def most_total_rev
  # SELECT o.ClientId, MAX(s.PricePerShare * o.numShares) AS Revenue
  # FROM orders o, stock s
  # WHERE o.orderType = 'sell'
  # AND s.StockSymbol = o.StockSymbol;
end

# Produce a list of most actively traded stocks
def actively_traded
  # SELECT stockSymbol, COUNT(*)
  # FROM ordeers
  # GROUP BY stockSymbol;
end

# Produce mailing list
def mailing_list
    # SELECT FirstName, Lastname, Email FROM client WHERE EmployeeId=$EmpID
end
# Customers current stock holdings
def curr_stock_holdings
  # SELECT h.stockSymbol, h.numShares
  # FROM hasstock h, account a, client c
  # WHERE a.clientId=c.Id
  # AND C.Id= $custId
end

# The share price of a given stock over a certain period of time
def share_price_for_given_stock
  # SELECT * FROM stockhistor WHERE ($dateChanged< and $dateChanged>);
end

# A history of all current and past orders a customer has placed
def customer_current_past
  # SELECT * FROM orders WHERE clientId=$clientId
end

# Stocks available of a particular type and most recent order info
def stocks_available
  # SELECT * FROM orders WHERE stock=ANY
end

# Stocks available with a particular keyword or set of keywords in the stock name, and most-recent stock info
def stocks_avilable_by_keyword
  # SELECT * FROM orders WHERE stock = $keyword
end

# Best seller stock list
def best_seller_stock_list
  # SELECT stock, COUNT(stock) AS val_stock FROM orders WHERE orderType = "sell"
  # GROUP BY stock order BY val_stock desc LIMIT 1;
end

# Personalized stock suggestion list
def stock_suggestion
  # SELECT stockSymbol FROM STOCK
  # WHERE tpyeOfStock = (
  # SELECT s.TypeOfStock
  # FROM client c, account a, hasstock h, stock s
  # WHERE c.Id=a.ClientId
  # AND h.stockSymbol = s.stockSymbol
  # AND h.accountId = a.Id
  # AND c.Id= $clientId
  # ORDER by h.numShares DESC);
end



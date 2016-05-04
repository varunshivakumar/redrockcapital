# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Manager
manager = Employee.create(
    last_name: 'Bill',
    first_name: 'Lumbergh',
    email: 'admin@gmail.com',
    admin: true,
    is_employee: true,
    hourly_rate: 100,

    password: 'asdfasdf',
    password_confirmation: 'asdfasdf'
)

# Employees
employee1 = Employee.create(
    ssn: '123-45-6789',
    last_name: 'Smith',
    first_name: 'David',
    address: '123 College Road',
    city: 'Stony Brook',
    state: 'NY',
    zipcode: '11790',
    telephone: '516-215-2345',
    created_at: "2005-11-01 00:00:00",
    hourly_rate: 60,

    is_employee: true,
    email: 'dsmith@cs.sunysb.edu',

    password: 'asdfasdf',
    password_confirmation: 'asdfasdf'
)

employee2 = Employee.create(
    ssn: '789-12-3456',
    last_name: 'Warren',
    first_name: 'David',
    address: '456 Sunken Street',
    city: 'Stony Brook',
    state: 'NY',
    zipcode: '11794',
    telephone: '631-632-9987',
    created_at: "2006-02-02 00:00:00",
    hourly_rate: 50,

    is_employee: true,
    email: 'dwarren@cs.sunysb.edu',

    password: 'asdfasdf',
    password_confirmation: 'asdfasdf'
)

# Clients and their respective accounts
client1 = Client.create(
    ssn: '111-11-1111',
    last_name: 'Yang',
    first_name: 'Shang',
    address: '123 Success Street',
    city: 'Stony Brook',
    state: 'NY',
    zipcode: '11790',
    telephone: '516-632-8959',
    email: 'syang@cs.sunysb.edu',

    credit_card_no: '1234-5678-1234-5678',
    rating: 1,

    password: 'asdfasdf',
    password_confirmation: 'asdfasdf'
)
account1 = Account.create(
    client_id: client1.id,
    employee_id: employee1.id
)

client2 = Client.create(
    ssn: '222-22-2222',
    last_name: 'Du',
    first_name: 'Victor',
    address: '456 Fortune Road',
    city: 'Stony Brook',
    state: 'NY',
    zipcode: '11790',
    telephone: '516-632-4360',
    email: 'vicdu@cs.sunysb.edu',

    credit_card_no: '5678-1234-5678-1234',
    rating: 1,

    password: 'asdfasdf',
    password_confirmation: 'asdfasdf'
)
account2 = Account.create(
    client_id: client2.id,
    employee_id: employee1.id
)


client3 = Client.create(
    ssn: '333-33-3333',
    last_name: 'Smith',
    first_name: 'John',
    address: '786 Peace Blvd.',
    city: 'Los Angeles',
    state: 'CA',
    zipcode: '93536',
    telephone: '315-443-4321',
    email: 'jsmith@ic.sunysb.edu',

    credit_card_no: '2345-6789-2345-6789',
    rating: 1,

    password: 'asdfasdf',
    password_confirmation: 'asdfasdf'
)
account3 = Account.create(
    client_id: client3.id,
    employee_id: employee2.id
)


client4 = Client.create(
    ssn: '444-44-4444',
    last_name: 'Philip',
    first_name: 'Lewis',
    address: '135 Knowledge Lane',
    city: 'Stony Brook',
    state: 'NY',
    zipcode: '11794',
    telephone: '516-666-8888',
    email: 'pml@cs.sunysb.edu',

    credit_card_no: '6789-2345-6789-2345',
    rating: 1,

    password: 'asdfasdf',
    password_confirmation: 'asdfasdf'
)
account4 = Account.create(
    client_id: client4.id,
    employee_id: employee2.id
)

# Stocks
max_num_shares = 10000
stock = StockQuote::Stock.quote('F');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'automotive', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('GM');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'automotive', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('TSLA');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'automotive', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('INTC');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'computer', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('IBM');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'computer', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('FB');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'technology', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('GOOG');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'technology', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('AAPL');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'technology', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('MSFT');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'technology', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('AMZN');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'web', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('EBAY');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'web', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('TWTR');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'web', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('NFLX');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'web', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('YHOO');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'web', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('COF');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'bank', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('JPM');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'bank', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('BAC');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'bank', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('WFC');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'bank', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('DIS');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'film', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('IMAX');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'film', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('ATVI');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'gaming', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('EA');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'gaming', price_per_share: stock.ask, total_num_shares: max_num_shares)
stock = StockQuote::Stock.quote('ZNGA');Stock.create(stock_symbol: stock.symbol, company_name: stock.name, stock_type: 'gaming', price_per_share: stock.ask, total_num_shares: max_num_shares)

# OwnsStocks
# =begin
gm_stock_id = Stock.where(stock_symbol: 'GM').first.id
f_stock_id = Stock.where(stock_symbol: 'F').first.id
ibm_stock_id = Stock.where(stock_symbol: 'IBM').first.id
ownStock1 = OwnsStock.create( # Client 444-44-4444 owns GM(250)
    num_shares: 250,
    price_per_share: 32.10,
    account_id: account4.id,
    stock_id: gm_stock_id
)

ownStock2 = OwnsStock.create( # Client 444-44-4444 owns F(100)
    num_shares: 100,
    price_per_share: 9.67,
    account_id: account4.id,
    stock_id: f_stock_id
)
ownStock3 = OwnsStock.create( # Client 222-22-2222 owns IBM(50)
    num_shares: 50,
    price_per_share: 89.45,
    account_id: account2.id,
    stock_id: ibm_stock_id
)
order1 = MarketOrder.create(
    num_shares: 75,
    completed: true,
    buy_sell_type: "buy",
    account_id: account4.id,
    employee_id: account4.employee_id,
    stock_id: gm_stock_id,
    order_type: 0,
    transaction_fee: 30
)

order2 = TrailingStopOrder.create(
    num_shares: 10,
    completed: true,
    price_per_share: 90.0,
    account_id: account2.id,
    employee_id: account2.employee_id,
    stock_id: ibm_stock_id,
    order_type: 3,
    transaction_fee: 50
)
# =end
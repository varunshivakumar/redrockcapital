class OrdersController < ApplicationController

  def new
    @order = Order.new
    @account_id = params[:account_id].to_i
    @buy_sell_type = params[:buy_sell_type]
  end

  def create
    byebug
    @order = Order.new(order_params)
    # Get Price per share
    # Calculate transaction fee
    # Determine completion
    # Determine employee

    # Create owns stock object
    if @user.save
      flash[:success] = "Succesful Order"
      redirect_to :root_path
    else
      flash[:notice] = "Unsuccessful Order"
      redirect_to :root_path
    end

  end

  private

  def order_params
    params.require(:order).permit(:num_shares, :buy_sell_type, :order_type, :account_id, :stock_id)
  end
end

class AdminController < ApplicationController
  def index
    @total_orders = Order.count
  end

  def login
    session[:user_id] = nil
    if User.count == 0
      redirect_to(:controller => "users", :action => "new")
    end
  end

end

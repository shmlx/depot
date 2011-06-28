module ApplicationHelper
  def current_cart_price
    Cart.find(session[:cart_id]).total_price
  end
end

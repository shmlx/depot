module ApplicationHelper

  def current_cart_price
    Cart.find(session[:cart_id]).total_price
  end
  
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

end

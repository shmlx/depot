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

  def convert_price(product_price)
    product_price *= 0.489 if I18n.locale.to_s == 'lv'
    number_to_currency(product_price) 
  end

end

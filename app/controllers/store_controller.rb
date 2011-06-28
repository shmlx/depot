class StoreController < ApplicationController
  def index
    
    @products = Product.all
    @cart = current_cart

    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
      

  end

end

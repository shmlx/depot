class ApplicationController < ActionController::Base

  before_filter :set_i18n_locale_from_params
  before_filter :authorize
  protect_from_forgery




  private

    def current_cart
      Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

  protected

    def authorize
      if User.count.zero?
        redirect_to :controller => :users, :action => :new, :notice => "Please create first admin"
        return
      end
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => "Please log in"
      end
    end

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = 
            "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { :locale => I18n.locale }
    end

=begin
    def authorize
      if  User.count == 0
        flash[:notice] = "Please create first admin"
        redirect_to(:controller => "users", :action => "create")
      else
        unless User.find_by_id(session[:user_id])
        flash[:notice] = "Please log in" 
        redirect_to(:controller => "login", :action => "login")
      end
    end
  end
=end
end

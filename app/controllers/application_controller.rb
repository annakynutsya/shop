class ApplicationController < ActionController::Base
    
    before_action :initialize_session
    before_action :load_cart
    

    
    private
#   Use callbacks to share common setup or constraints between actions.
  def initialize_session
    session[:cart] ||= [] # empty cart = empty array
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end
  
  def set_products
    @products = Product.all
  end

  def set_categories
    @categories = Category.all 
  end
end


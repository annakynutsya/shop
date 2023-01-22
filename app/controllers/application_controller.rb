class ApplicationController < ActionController::Base
    
    before_action :set_products
    before_action :set_categories

    
    private
  # Use callbacks to share common setup or constraints between actions.
  def set_products
    @products = Product.all
  end

  def set_categories
    @categories = Category.all 
  end
end


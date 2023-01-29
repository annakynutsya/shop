class HomeController < ApplicationController
  def index
    if params[:id]
      @products = Product.where(category_id: params[:id])
    else
      @products = Product.all
    end
    
  end
end

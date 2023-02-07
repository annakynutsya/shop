class ProductsController < ApplicationController
  def index
    if params[:id]
      @products = collection.where(category_id: params[:id])
    else
      @products = collection
    end

  end

  def show
    @product = resource
  end

  private

  def collection
    Product.ordered
  end

  def resource
    collection.find(params[:id])
  end
end

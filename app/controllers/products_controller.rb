class ProductsController < ApplicationController
  def index
    @products = collection
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

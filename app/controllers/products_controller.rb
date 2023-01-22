class ProductsController < ApplicationController
    
    def index
        @products = Product.all
    end

    private
    def set_product
        @product = Product.find(params[:id])
    end

    def product_params
        params.require(:products).permit(:name, :description, :category_id)
    end
end

class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
        @products = Product.all
    end

    def add_to_cart
        id = params[:id].to_i
        session[:cart] << id unless session[:cart].include?(id)
        redirect_to products_path
      end
    
      def remove_from_cart
        id = params[:id].to_i
        session[:cart].delete(id)
        redirect_to cart_path
      end
    
      def show

      end

    private
    def set_product
        @product = Product.find(params[:id])
    end

    def product_params
        params.require(:products).permit(:name, :description, :category_id)
    end
end

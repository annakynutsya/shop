class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end
  def index
    @categories = Category.all
  end
  def show
    @category = Category.find(params[:id])
  end
  private
    def set_category
        @category = Category.find(params[:id])
    end
    def category_params
      params.require(:category).permit(:name)
  end
end

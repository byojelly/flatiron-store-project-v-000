class CategoriesController < ApplicationController

  def show
    #binding.pry
      @category = Category.find_by(id: params[:id])
      @items = @category.items
  end
end

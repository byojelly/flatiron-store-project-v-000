class StoreController < ApplicationController
  before_action :require_logged_in, except: [:index]
  def index
      @categories = Category.all
      @items = Item.available_items
#binding.pry
  end
end

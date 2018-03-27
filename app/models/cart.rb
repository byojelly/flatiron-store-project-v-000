class Cart < ActiveRecord::Base
    belongs_to :user
    has_many :line_items
    has_many :items, through: :line_items

    def total
        total =0
        self.line_items.each do |line_item|
            total += (line_item.item.price * line_item.quantity)
        end
        total
    end
    def add_item(item_id)
        item = line_items.find_by(item_id: item_id)
        if !item
            item = line_items.build(item_id: item_id)
        else
            item.quantity +=1
        end
        item
    end
    def checkout
    #  binding.pry
        subtract_inventory
        self.user.remove_cart
        self.update(status: "submitted")
        self.user.carts << self
    #    binding.pry
    end
    def subtract_inventory
      #  binding.pry
        self.line_items.each do |line_item|
          line_item.item.remove(line_item.quantity)
        end
    end
end

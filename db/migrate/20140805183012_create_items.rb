class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :inventory
      t.integer :price#, :precision => 10, :scale => 2 #use .decimal when precision of accuracyt of numbers is vital
      t.integer :category_id
    end
  end
end

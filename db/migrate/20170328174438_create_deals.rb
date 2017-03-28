class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :title
      t.boolean :is_live
      t.text :discription
      t.float :price
      t.float :discounted_price
      t.integer :quantity
      t.date :publish_date
      t.attachment :image

      t.timestamps null: false
    end
  end
end

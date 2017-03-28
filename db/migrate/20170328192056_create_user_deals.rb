class CreateUserDeals < ActiveRecord::Migration
  def change
    create_table :user_deals do |t|
      t.integer :user_id
      t.integer :deal_id
      t.integer :discount
      t.foreign_key :deals
      t.foreign_key :users

      t.timestamps null: false
    end
  end
end

class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
    	t.string :greeting
    	t.string :special_request
    	t.integer :total_price
    	t.string :delivery_date
    	t.timestamps
    end
  end
end

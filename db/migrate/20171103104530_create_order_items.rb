class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :order, index: true, foreign_key: true
      t.references :meal,  index: true, foreign_key: true

      t.timestamps
    end
  end
end

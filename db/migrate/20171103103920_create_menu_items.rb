class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.references :menu, index: true, foreign_key: true
      t.references :meal, index: true, foreign_key: true
      t.integer    :price

      t.timestamps
    end
  end
end

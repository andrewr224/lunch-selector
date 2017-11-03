class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :course

      t.timestamps
    end
  end
end

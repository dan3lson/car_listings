class AddIndicesToCars < ActiveRecord::Migration
  def change
    add_index :cars, :year
    add_index :cars, :color
    add_index :cars, :manufacturer_id
  end
end

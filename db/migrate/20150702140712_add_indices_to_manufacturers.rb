class AddIndicesToManufacturers < ActiveRecord::Migration
  def change
    add_index :manufacturers, :name, unique: true
    add_index :manufacturers, :country, unique: true
  end
end

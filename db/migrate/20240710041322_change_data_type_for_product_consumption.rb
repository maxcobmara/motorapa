class ChangeDataTypeForProductConsumption < ActiveRecord::Migration[7.0]
  def up
    change_column :products, :consumption_lkm, :decimal, precision: 5, scale: 2
    change_column :products, :drive_category, :string
    add_column :products, :retired_on, :date
    add_column :products, :launched_on, :date
    add_column :products, :created_by, :integer
    add_column :products, :updated_by, :integer
  end
  
  def down
    change_column :products, :consumption_lkm, :decimal, precision: 5, scale: 2
    change_column :products, :drive_category, :integer
    remove_column :products, :retired_on, :date
    remove_column :products, :launched_on, :date
    remove_column :products, :created_by, :integer
    remove_column :products, :updated_by, :integer
  end
end

class FixesForAssoc < ActiveRecord::Migration[7.0]
  def up
    change_column :products, :manufacturer_id, :integer, using: 'CAST(manufacturer_id AS integer)'
    change_column :products, :displacement, :decimal, precision: 5, scale: 1
    add_column :products, :cooling, :string

  end
  
  def down
    change_column :products, :manufacturer_id, :string
    change_column :products, :displacement, :integer
    remove_column :products, :cooling
  end
end

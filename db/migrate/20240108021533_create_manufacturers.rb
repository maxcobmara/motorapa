class CreateManufacturers < ActiveRecord::Migration[7.0]
  def change
    create_table :manufacturers do |t|
      t.string :slug,              null: false
      t.string :name
      t.string :website
      t.string :country
      t.text :data

      t.timestamps
    end
    add_index :manufacturers, :slug, unique: true
  end
end

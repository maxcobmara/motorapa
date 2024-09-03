class CreateMedia < ActiveRecord::Migration[7.0]
  def change
    create_table :media do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.string :title
      t.string :url
      t.string :url_source
      t.string :publisher
      t.date :published_on
      t.text :data

      t.timestamps
    end
  end
end

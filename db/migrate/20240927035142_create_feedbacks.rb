class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.string :category
      t.string :url
      t.string :name
      t.string :email
      t.string :phone
      t.string :country
      t.string :comment
      t.boolean :contact_me

      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :price
      t.string :description
      t.string :image_url
      t.string :brand
      t.string :link

      t.timestamps
    end
  end
end

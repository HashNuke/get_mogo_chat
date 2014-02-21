class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.text :email
      t.text :name
      t.text :order_number
      t.text :seller_id
      t.text :product_id
      t.text :product_permalink
      t.integer :price
      t.boolean :test

      t.timestamps
    end
  end
end

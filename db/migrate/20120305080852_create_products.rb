class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :title
      t.integer :category_id
      t.string :description
      t.string :price, :default => "0"
      t.timestamps
    end
  end
end

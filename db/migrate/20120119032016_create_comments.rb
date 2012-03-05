# -*- encoding : utf-8 -*-
class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :guest_name
      t.string :guest_email
      t.integer :user_id
      t.integer :product_id
      t.timestamps
    end
  end
end

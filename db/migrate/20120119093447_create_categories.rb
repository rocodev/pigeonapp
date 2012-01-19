# -*- encoding : utf-8 -*-
class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.integer :company_id
      t.integer :questions_count, :default => 0
      t.timestamps
    end
  end
end

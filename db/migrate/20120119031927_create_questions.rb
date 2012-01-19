# -*- encoding : utf-8 -*-
class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :guest_name
      t.string :guest_email
      t.string :subject
      t.string :content
      t.integer :company_id
      t.integer :user_id
      t.integer :category_id
      t.integer :comments_count , :default => 0
      t.timestamps
    end
  end
end

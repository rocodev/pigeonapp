class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.string :content
      t.integer :company_id
      t.integer :user_id
      t.integer :category_id
      t.timestamps
    end
  end
end

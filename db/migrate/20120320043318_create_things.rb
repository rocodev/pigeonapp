class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :verb
      t.string :description
      t.string :reason
      t.integer :user_id
      t.timestamps
    end
  end
end

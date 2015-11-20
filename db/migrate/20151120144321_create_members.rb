class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.text :status
      t.integer :ethnicity
      t.integer :weight
      t.integer :height
      t.boolean :is_veg
      t.boolean :drink
      t.date :dob
      t.text :image

      t.timestamps null: false
    end
  end
end

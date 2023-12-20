class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.text :comment
      t.integer :book_image_id
      t.timestamps
    end
  end
end

class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :content
      t.integer :order
      t.string :lesson_type

      t.timestamps
    end
  end
end

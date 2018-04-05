class CreateLessonGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :lesson_groups do |t|
      t.string :title
      t.integer :order

      t.timestamps
    end
  end
end

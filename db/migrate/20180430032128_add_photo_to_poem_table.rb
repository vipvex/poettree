class AddPhotoToPoemTable < ActiveRecord::Migration[5.1]
  def change
    add_column :lesson_groups, :photo, :string
  end
end

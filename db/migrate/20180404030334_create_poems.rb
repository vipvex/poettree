class CreatePoems < ActiveRecord::Migration[5.1]
  def change
    create_table :poems do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true
      t.string :image_url
      t.boolean :shared

      t.timestamps
    end
  end
end

class AddAuthorNameToPoems < ActiveRecord::Migration[5.1]
  def change
    add_column :poems, :author_name, :string
  end
end

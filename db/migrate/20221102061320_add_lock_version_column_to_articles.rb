class AddLockVersionColumnToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :lock_version, :integer
  end
end

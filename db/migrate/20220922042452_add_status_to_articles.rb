class AddStatusToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :status, :string, default: :active
  end
end

class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.references :account, null: false, foreign_key: true, index: true
      t.string :title, null: false, limit: 128
      t.text :body, null: false
      t.string :status, null: false, default: :active, limit: 16
      t.integer :lock_version, limit: 8

      t.timestamps
    end
  end
end

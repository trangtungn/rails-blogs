class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :article, null: false, foreign_key: true, index: true
      t.string :commenter, null: false
      t.text :content
      t.string :status, null: false, default: :pending, limit: 16

      t.timestamps
    end
  end
end

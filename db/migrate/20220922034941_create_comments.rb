class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :commenter, null: false
      t.text :content
      t.references :article, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end

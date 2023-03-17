class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :account, null: false, foreign_key: true, index: true
      t.string :subject, null: false, limit: 128
      t.text :body
      t.string :status, default: :active, limit: 16

      t.timestamps
    end
  end
end

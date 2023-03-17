class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.references :account, null: false, foreign_key: true, index: true
      t.references :entryable, polymorphic: true, null: false, index: true
      t.string :status, default: :active, limit: 16

      t.timestamps
    end
  end
end

class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.references :account, null: false, foreign_key: true, index: true
      t.references :entryalbe, polymorphic: true, null: false, index: true
      t.string :status

      t.timestamps
    end
  end
end

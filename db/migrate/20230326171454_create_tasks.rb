class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :account, null: false, foreign_key: true, index: true
      t.string :description, null: false, limit: 200
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end

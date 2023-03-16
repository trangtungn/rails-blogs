class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.string :status, default: :active

      t.timestamps
    end
  end
end

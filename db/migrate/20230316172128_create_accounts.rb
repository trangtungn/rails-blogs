class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.citext :email, null: false, index: true, unique: true
      t.string :username
      t.string :status, null: false, default: :active

      t.timestamps
    end
  end
end

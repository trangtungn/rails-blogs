class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :display_name
      t.string :username
      t.string :domain
      t.string :timezone

      t.timestamps
    end
  end
end

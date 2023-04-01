class CreateAgentProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :agent_profiles do |t|
      t.references :account, null: false, foreign_key: true
      t.references :profileable, polymorphic: true, null: false
      t.boolean :active

      t.timestamps
    end
  end
end

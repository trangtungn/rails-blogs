class EnablePostgresExtensions < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    enable_extension 'citext'
    enable_extension 'plpgsql'
  end
end
